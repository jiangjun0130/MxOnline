# _*_ coding: utf-8 _*_
__author__ = 'jiangjun'
__date__ = '2018/3/7 下午1:35'

import  xadmin

from .models import Course, Lesson, Video, CourseResource


class CourseAdmin(object):
    list_display = ['name', 'detail', 'degree', 'learn_times', 'students']
    search_fields = ['name', 'detail', 'degree', 'learn_times', 'students']
    list_filter = ['name', 'detail', 'degree', 'learn_times', 'students']


xadmin.site.register(Course, CourseAdmin)


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course', 'name', 'add_time']


xadmin.site.register(Lesson, LessonAdmin)