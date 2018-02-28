# -*- coding:utf-8 -*-
__author__ = 'yeyilu'

from django.conf.urls import url, include

from .views import MovieDetailView, AddFavView, MovieCommentView, AddCommentView

urlpatterns = [
    # 电影详情(播放)页
    url(r'^detail/(?P<movie_id>\d+)/$', MovieDetailView.as_view(), name="movie_detail"),
    # 用户添加收藏电影
    url(r'^add_fav/$', AddFavView.as_view(), name="add_fav"),
    # 电影评论
    url(r'^comment/(?P<movie_id>\d+)/$', MovieCommentView.as_view(), name="movie_comment"),
    # 添加评论
    url(r'^add_comment/$', AddCommentView.as_view(), name="add_comment"),

]
