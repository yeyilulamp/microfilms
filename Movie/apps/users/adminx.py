# -*- coding:utf-8 -*-
__author__ = 'yeyilu'

import xadmin
from xadmin import views

from .models import EmailVerifyRecord, PageBanner


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = "微电影网站后台管理系统"
    site_footer = "微电影网站"
    menu_style = "accordion"


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']


class PageBannerAdmin(object):
    list_display = ['title', 'image', 'index', 'add_time']
    search_fields = ['title', 'image', 'index']
    list_filter = ['title', 'image', 'index', 'add_time']


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)
xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(PageBanner, PageBannerAdmin)
