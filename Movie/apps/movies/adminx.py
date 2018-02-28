# -*- coding:utf-8 -*-
__author__ = 'yeyilu'

import xadmin

from .models import Movie


class MovieAdmin(object):
    list_display = ['title', 'movie_tag', 'star', 'play_nums', 'fav_nums', 'comment_nums', 'url', 'video_times',
                    'area', 'release_time', 'add_time']
    search_fields = ['title', 'movie_tag', 'image', 'star', 'play_nums', 'fav_nums', 'comment_nums', 'detail', 'url',
                     'video_times',
                     'area']
    list_filter = ['title', 'image', 'movie_tag', 'star', 'play_nums', 'fav_nums', 'comment_nums', 'detail', 'url',
                   'video_times',
                   'area', 'release_time', 'add_time']

    # 设置播放量 收藏人数，评论量字段为不可编辑,只读模式
    readonly_fields = ['play_nums', 'fav_nums', 'comment_nums']
    # 导入富文本编辑器ueditor
    style_fields = {"detail": "ueditor"}
    # 导入excel功能
    import_excel = True


xadmin.site.register(Movie, MovieAdmin)
