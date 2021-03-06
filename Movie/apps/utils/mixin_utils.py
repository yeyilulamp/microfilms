# -*- coding:utf-8 -*-
__author__ = 'yeyilu'

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

# 用户登录权限控制

class LoginRequiredMixin(object):

    @method_decorator(login_required(login_url='/login/'))
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)
