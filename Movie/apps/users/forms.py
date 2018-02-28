# -*- coding:utf-8 -*-
__author__ = 'yeyilu'
from django import forms
from captcha.fields import CaptchaField

from .views import UserProfile


# 登录表单验证
class LoginForm(forms.Form):
    # 用户名密码不能为空
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)


# 验证码form  注册表单form
class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    # 密码不能小于5位
    password = forms.CharField(required=True, min_length=5)
    # 应用验证码 自定义错误输出key必须与异常一样
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class ActiveForm(forms.Form):
    # 激活时不对邮箱密码做验证
    # 应用验证码 自定义错误输出key必须与异常一样
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


# 注册验证码实现
class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


# 用户重置密码
class ModifyPwdForm(forms.Form):
    # 密码不能小于5位
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


# 用户修改头像form
class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']


# 用户个人信息修改form
class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name', 'birday', 'gender', 'address', 'mobile']
