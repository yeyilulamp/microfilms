# -*- coding:utf-8 -*-
"""Movie URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve

import xadmin
from Movie.settings import MEDIA_ROOT
from users.views import LoginView, RegisterView, ActiveUserView, ForgetPwdView, ResetView, ModifyPwdView, IndexView, \
    BannerView, LogoutView

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    # 后台管理系统xadmin url配置
    url(r'^xadmin/', xadmin.site.urls),
    # 首页url配置
    # url(r'^$', TemplateView.as_view(template_name="index.html"), name="index"),
    url(r'^$', IndexView.as_view(), name="index"),
    # 轮播图url配置
    # url(r'^animation/$', TemplateView.as_view(template_name="animation.html"), name="animation"),
    url(r'^animation/$', BannerView.as_view(), name="animation"),
    # 用户登录url配置
    url(r'^login/$', LoginView.as_view(), name="login"),
    # 用户注册url配置
    url(r'^register/$', RegisterView.as_view(), name="register"),
    # 用户退出登录url配置
    url(r'^logout/$', LogoutView.as_view(), name="logout"),
    # 用户注册验证码图片url配置
    url(r'^captcha/', include('captcha.urls')),
    # 用户激活链接url配置
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="user_active"),
    # 忘记密码url配置
    url(r'^forget/$', ForgetPwdView.as_view(), name="forget_pwd"),
    # 用户密码重置url配置
    url(r'^reset/(?P<active_code>.*)/$', ResetView.as_view(), name="reset_pwd"),
    # 修改密码url; 用于passwordreset页面提交表单
    url(r'^modify_pwd/$', ModifyPwdView.as_view(), name="modify_pwd"),

    # 电影相关url配置
    url(r'^movie/', include('movies.urls', namespace="movie")),
    # 用户相关url配置
    url(r'^users/', include('users.urls', namespace="users")),
    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)/$', serve, {'document_root': MEDIA_ROOT}),

    # 富文本编辑器ueditor相关url
    url(r'^ueditor/', include('DjangoUeditor.urls')),
]

# 全局404页面配置
handler404 = 'users.views.page_not_found'
# 全局503页面配置
handler500 = 'users.views.page_error'
