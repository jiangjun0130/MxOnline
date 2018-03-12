# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/12 14:19 '

from django import forms


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=6)
