# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/16 9:42 '

from django.urls import path, re_path

from .views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView


app_name = 'user'
urlpatterns = [
    # 用户信息
    path('info/', UserInfoView.as_view(), name='user_info'),
    path('image_upload/', UploadImageView.as_view(), name='image_upload'),
    # 用户个人中心修改密码
    path('update/pwd', UpdatePwdView.as_view(), name='update_pwd'),
    # 发送邮箱验证码
    path('send_email_code/', SendEmailCodeView.as_view(), name='send_email_code'),
    # 修改邮箱
    path('update_email/', UpdateEmailView.as_view(), name='update_email'),
]