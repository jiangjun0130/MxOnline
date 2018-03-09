# _*_ coding: utf-8 _*_
__author__ = 'jiangjun'
__date__ = '2018/3/6 下午11:13'

import xadmin
from xadmin import views

from .models import EmailVerifyRecord, Banner, TestBug


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)


class GlobalSettings(object):
    site_title = '慕学后台管理系统'
    site_footer = '慕学在线网'
    menu_style = 'accordion'


xadmin.site.register(views.CommAdminView, GlobalSettings)


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email']
    list_filter = ['code', 'email', 'send_type', 'send_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index']


xadmin.site.register(Banner, BannerAdmin)


class TestBugAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = ['name']

xadmin.site.register(TestBug, TestBugAdmin)