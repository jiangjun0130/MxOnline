# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/16 9:42 '

from django.urls import path, re_path

from .views import UserInfoView, UploadImageView, UpdatePwdView


app_name = 'user'
urlpatterns = [
    # 用户信息
    path('info/', UserInfoView.as_view(), name='user_info'),
    path('image_upload/', UploadImageView.as_view(), name='image_upload'),
    # 用户个人中心修改密码
    path('update/pwd',UpdatePwdView.as_view(), name='update_pwd')
]