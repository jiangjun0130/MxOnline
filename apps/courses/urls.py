# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/16 9:42 '

from django.urls import path, re_path

from .views import CourseListView, CourseDetailView, CourseInfoView, CourseCommentView, AddCommentView


app_name = 'course'
urlpatterns = [
    # 课程机构首页
    path('list/', CourseListView.as_view(), name='list'),
    path('detail/<int:course_id>', CourseDetailView.as_view(), name='detail'),
    path('info/<int:course_id>', CourseInfoView.as_view(), name='info'),
    path('comment/<int:course_id>', CourseCommentView.as_view(), name='comment'),
    path('add_comment/', AddCommentView.as_view(), name='add_comment'),
]