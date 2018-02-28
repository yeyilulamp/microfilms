# -*- coding:utf-8 -*-
import json

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.db.models import Q
from django.views.generic.base import View

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .models import UserProfile, EmailVerifyRecord, PageBanner
from movies.models import Movie
from user_operation.models import UserFavorite, MovieComments
from .forms import LoginForm, RegisterForm, ActiveForm, ForgetForm, ModifyPwdForm, UploadImageForm, UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin


# Create your views here.
# 实现用户名 昵称 手机号码 邮箱均可登录
# 继承ModelBackend类，因为使用方法authenticate
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(
                Q(nick_name=username) | Q(username=username) | Q(email=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class ActiveUserView(View):
    """
    激活用户的view
    """

    def get(self, request, active_code):
        # 查询邮箱验证记录是否存在
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        # 如果不为空则表示有用户
        active_form = ActiveForm(request.GET)
        if all_records:
            for record in all_records:
                # 获取到对应的邮箱
                email = record.email
                # 查找到邮箱对应的user
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
                # 激活成功跳转到登录页面
                return render(request, "login.html")
        else:
            return render(request, "register.html", {
                "msg": "你的激活链接无效,请重新请求！",
                "active_form": active_form
            })


class ForgetPwdView(View):
    """
    用户忘记密码的处理view
    """

    def get(self, request):
        forget_form = ForgetForm()
        return render(request, "forgetpwd.html", {"forget_form": forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        # form验证合法情况下取出email
        if forget_form.is_valid():
            email = request.POST.get("email", "")
            # 发送找回密码邮件
            send_register_email(email, "forget")
            # 发送完毕返回登录页面并显示发送邮件成功
            return render(request, "login.html", {"msg": "重置密码邮件已发送,请注意查收"})
        # 如果表单验证失败就是验证码输错误
        else:
            return render(request, "forgetpwd.html", {"forget_form": forget_form})


class ResetView(View):
    """
    重置密码的view
    """

    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        active_form = ActiveForm(request.GET)
        if all_records:
            for record in all_records:
                # 获取到对应的邮箱
                email = record.email
                return render(request, "password_reset.html", {"email": email})
        else:
            return render(request, "forgetpwd.html", {"msg": "你的重置密码无效，请重新请求", "active_form": active_form})


class ModifyPwdView(View):
    """
    改变密码的view
    """

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', "")
            pwd2 = request.POST.get('password2', "")
            email = request.POST.get('email', "")
            # 如果两次密码不相等，返回错误信息
            if pwd1 != pwd2:
                return render(request, "password_reset.html", {"email": email, "msg": "密码不一致，请重新输入！"})
            # 如果密码一致
            user = UserProfile.objects.get(email=email)
            # 密码加密处理
            user.password = make_password(pwd2)
            user.save()
            return render(request, "login.html", {"msg": "密码修改成功，请登录"})
        else:
            # 验证失败说明密码位数不够
            email = request.POST.get('email', "")
            return render(request, "password_reset.html", {
                "email": email,
                "msg": "新密码至少5个字符,请重新输入",
                "modify_form": modify_form
            })


class UserInfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """

    def get(self, request):
        current_page = 'info'
        return render(request, "user.html", {
            "current_page": current_page
        })

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type="application/json")


# 用户上传图片的view:用于修改头像
class UploadImageView(LoginRequiredMixin, View):
    # 使用modelfrom
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            # request.user.save()
            # # 取出cleaned data中的值,一个dict
            # image = image_form.cleaned_data['image']
            # request.user.image = image
            # request.user.save()
            # return HttpResponse('{"status":"success"}', content_type="application/json")
            return HttpResponseRedirect("/users/info")
        else:
            return HttpResponse('{"status":"fail"}', content_type="application/json")


class UpdatePwdView(LoginRequiredMixin, View):
    """
    个人中心修改用户密码
    """

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', "")
            pwd2 = request.POST.get('password2', "")
            email = request.POST.get('email', "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}', content_type="application/json")
            user = request.user
            user.password = make_password(pwd2)
            user.save()

            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type="application/json")


class SendEmailCodeView(View):
    """
    发送邮箱验证码
    """

    def get(self, request):
        email = request.GET.get("email", "")

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在！"}', content_type="application/json")
        # 发送邮箱验证码
        send_register_email(email, "update_email")
        return HttpResponse('{"status":"success"}', content_type="application/json")


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改个人邮箱
    """

    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")
        # post传递过来的email和邮箱验证码code与数据库中的email和code匹配则表示输入了正确的邮箱和验证码
        exists_record = EmailVerifyRecord.objects.filter(email=email, code=code)
        if exists_record:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse('{"email":"验证码出错！,请重新请求获取"}', content_type="application/json")


class UserFavMovieView(LoginRequiredMixin, View):
    """"
    用户收藏的电影
    """

    def get(self, request):
        current_page = 'favmovie'
        movie_list = []
        fav_movies = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_movie in fav_movies:
            movie_id = fav_movie.fav_id
            movie = Movie.objects.get(id=int(movie_id))
            movie_list.append(movie)

        # 统计用户收藏电影的数量
        movie_nums = len(movie_list)

        # 对用户收藏的电影进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(movie_list, 1, request=request)

        movie_list = p.page(page)
        return render(request, "moviecol.html", {
            "movie_list": movie_list,
            "current_page": current_page,
            "movie_nums": movie_nums
        })


class UserMovieCommentView(LoginRequiredMixin, View):
    """
    用户的电影评论记录
    """

    def get(self, request):
        current_page = 'usercomment'
        movie_comments = MovieComments.objects.filter(user=request.user)
        # 对用户评论的电影进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(movie_comments, 2, request=request)

        movie_comments = p.page(page)
        return render(request, "comments.html", {
            "movie_comments": movie_comments,
            "current_page": current_page
        })


class LogoutView(View):
    """
    用户退出登录
    """

    def get(self, request):
        logout(request)
        # Redirect导入指定的url
        return HttpResponseRedirect(reverse("index"))


class LoginView(View):
    """
    用户登录
    """

    # 直接调用get方法免去判断
    def get(self, request):
        # render渲染html返回用户
        # render三变量: request 模板名称 一个dict写明传给前端的值
        return render(request, "login.html", {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    # 用户在已激活的状态下,将重定向到index首页
                    return HttpResponseRedirect(reverse("index"))
                    # return render(request, "index.html")  # 跳转到对应的模板页面
                else:
                    return render(request, "login.html", {"msg": "用户未激活！"})
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误！"})
        else:
            return render(request, "login.html", {"login_form": login_form})


class RegisterView(View):
    """
    用户注册
    """

    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            # 查询post传递过来的email是否已经存在数据库中,email存在则表示用户已经存在
            if UserProfile.objects.filter(email=user_name):
                return render(request, "register.html", {"register_form": register_form, "msg": "用户已经存在"})
            pass_word = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            # 用户默认是激活的状态，需要设置为未激活
            user_profile.is_active = False
            # 对用户传递过来的密码进行加密处理
            user_profile.password = make_password(pass_word)
            user_profile.save()
            send_register_email(user_name, "register")
            return render(request, "login.html")
        else:
            return render(request, "register.html", {"register_form": register_form})


class BannerView(View):
    """
    首页轮播图
    """

    # 取出所有轮播图
    def get(self, request):
        all_banner = PageBanner.objects.all().order_by("index")
        return render(request, "animation.html", {
            "all_banner": all_banner
        })


class IndexView(View):
    """
    电影列表页(首页)
    """

    def get(self, request):
        all_movies = Movie.objects.all().order_by("-release_time")
        # 全局搜索功能 电影名称搜索
        search_keywords = request.GET.get('keywords', "")
        # 使用模糊查询like -> 字段名称__icontains 的方式搜索
        if search_keywords:
            all_movies = all_movies.filter(Q(title__icontains=search_keywords))

        # 对电影进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_movies, 8, request=request)

        movies = p.page(page)
        return render(request, "index.html", {
            "all_movies": movies,
        })


def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response("404.html", {})
    response.status_code = 404
    return response


def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response("500.html", {})
    response.status_code = 500
    return response
