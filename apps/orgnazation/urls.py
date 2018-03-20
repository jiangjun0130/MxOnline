# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/16 9:42 '

from django.urls import path, re_path, include

from .views import OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgIntroduceView, OrgTeacherView, AddFavView
from .views import TeacherListView, TeacherDetailView

app_name = 'org'
urlpatterns = [
    # 课程机构首页
    path('list/', OrgView.as_view(), name='list'),
    path('add_ask/', AddUserAskView.as_view(), name='add_ask'),
    path('home/<int:org_id>', OrgHomeView.as_view(), name='home'),
    path('courses/<int:org_id>', OrgCourseView.as_view(), name='courses'),
    path('introduce/<int:org_id>', OrgIntroduceView.as_view(), name='introduce'),
    path('org_teacher/<int:org_id>', OrgTeacherView.as_view(), name='teacher'),
    path('add_fav/', AddFavView.as_view(), name='addFav'),

    path('teacher/list/', TeacherListView.as_view(), name='teacher_list'),
    path('teacher/detail/<int:teacher_id>', TeacherDetailView.as_view(), name='teacher_detail')
]