# -*- coding:utf-8 -*-
__author__ = 'yeyilu'

import xadmin

from .models import MovieComments, UserFavorite


class MovieCommentsAdmin(object):
    list_display = ['user', 'movie', 'comments', 'add_time']
    search_fields = ['user__username', 'user__nick_name', 'movie__title', 'comments']
    list_filter = ['user', 'movie', 'comments', 'add_time']
    # 导入excel功能
    import_excel = True


class UserFavoriteAdmin(object):
    list_display = ['user', 'fav_type', 'add_time']
    search_fields = ['user__username', 'user__nick_name', 'fav_type']
    list_filter = ['user', 'fav_type', 'add_time']
    # 导入excel功能
    import_excel = True


xadmin.site.register(MovieComments, MovieCommentsAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)
