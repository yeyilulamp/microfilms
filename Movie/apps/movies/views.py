# -*- coding:utf-8 -*-
from django.shortcuts import render

# Create your views here.
from .models import Movie
from django.http import HttpResponse
from django.views.generic.base import View

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from utils.mixin_utils import LoginRequiredMixin
from user_operation.models import UserFavorite, MovieComments


class MovieDetailView(View):
    """
    电影详情页 播放页
    """

    def get(self, request, movie_id):
        movie = Movie.objects.get(id=int(movie_id))
        # 增加电影播放量
        movie.play_nums += 1
        movie.save()
        # 是否收藏电影
        has_fav_movie = False
        if request.user.is_authenticated():
            # 如果用户是在登录的状态下
            if UserFavorite.objects.filter(user=request.user, fav_id=movie.id, fav_type=1):
                # 可收藏电影
                has_fav_movie = True

        return render(request, "play.html", {
            "movie": movie,
            "has_fav_movie": has_fav_movie,
        })


class AddFavView(View):
    """
    用户收藏,用户取消收藏
    """

    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        exists_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exists_records:
            # 如果记录已经存在则删除(表示用户取消收藏)
            exists_records.delete()
            # 收藏数的判断 收藏数的取消
            if int(fav_type) == 1:
                movie = Movie.objects.get(id=int(fav_id))
                movie.fav_nums -= 1
                if movie.fav_nums < 0:
                    movie.fav_nums = 0
                movie.save()
            return HttpResponse('{"status":"success","msg":"收藏电影"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                # 收藏数的判断 收藏数的添加(收藏)
                if int(fav_type) == 1:
                    movie = Movie.objects.get(id=int(fav_id))
                    movie.fav_nums += 1
                    movie.save()
                return HttpResponse('{"status":"success","msg":"已收藏电影"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type='application/json')


class MovieCommentView(LoginRequiredMixin, View):
    """
    电影评论view处理
    """

    def get(self, request, movie_id):
        movie = Movie.objects.get(id=int(movie_id))
        # 添加电影播放量
        movie.play_nums += 1
        movie.save()
        all_comments = MovieComments.objects.all().order_by("-id")
        # 对用户评论进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_comments, 3, request=request)

        comments = p.page(page)
        return render(request, "play.html", {
            "movie": movie,
            "all_comments": comments
        })


class AddCommentView(LoginRequiredMixin, View):
    """
    用户添加电影评论view处理
    """

    def post(self, request):
        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')

        movie_id = request.POST.get("movie_id", 0)
        comments = request.POST.get("comments", "")
        if int(movie_id) > 0 and comments:
            movie_comments = MovieComments()
            # 获取评论对应的电影
            movie = Movie.objects.get(id=int(movie_id))

            # 添加电影的评论数
            movie.comment_nums += 1
            movie.save()

            movie_comments.movie = movie
            movie_comments.comments = comments
            movie_comments.user = request.user
            movie_comments.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}', content_type='application/json')
