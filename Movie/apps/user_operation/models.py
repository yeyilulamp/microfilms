# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

from users.models import UserProfile
from movies.models import Movie


# Create your models here.

class MovieComments(models.Model):
    """
    用户电影评论
    """
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    movie = models.ForeignKey(Movie, verbose_name=u"电影")
    comments = models.CharField(max_length=200, verbose_name=u"评论")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"电影评论"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u"电影评论"


class UserFavorite(models.Model):
    """
    用户电影收藏
    """
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    fav_id = models.IntegerField(default=0, verbose_name=u"数据id")
    fav_type = models.IntegerField(choices=((1, u"电影"),), default=1, verbose_name=u"收藏类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u"用户收藏"
