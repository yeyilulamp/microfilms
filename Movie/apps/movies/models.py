# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime

from DjangoUeditor.models import UEditorField

from django.db import models


# Create your models here.


class Movie(models.Model):
    """
    电影信息
    """
    title = models.CharField(max_length=200, unique=True, verbose_name=u"标题")
    image = models.ImageField(max_length=100, upload_to="movies/%Y/%m", verbose_name=u"封面图")
    movie_tag = models.CharField(max_length=10, default=u"剧情", verbose_name=u"标签")
    star = models.CharField(max_length=5, default='xxx', verbose_name=u"星级")
    play_nums = models.IntegerField(default=0, verbose_name=u"播放量")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    comment_nums = models.IntegerField(default=0, verbose_name=u"评论量")
    url = models.CharField(default="", max_length=200, verbose_name=u"访问地址")
    video_times = models.CharField(max_length=30, verbose_name=u"视频时长(分钟数)")
    area = models.CharField(max_length=20, verbose_name=u"上映地区")
    release_time = models.DateField(verbose_name=u"上映时间")
    detail = UEditorField(verbose_name=u"影片介绍", width=600, height=300, imagePath="movies/ueditor/",
                          filePath="movies/ueditor/", default='')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"电影信息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.title
