# _*_ coding: utf-8 _*_
__author__ = 'jiangjun'
__date__ = '2018/3/7 下午1:35'

import xadmin

from .models import Course, Lesson, Video, CourseResource


class CourseAdmin(object):
    list_display = ['name', 'detail', 'degree', 'learn_times', 'students']
    search_fields = ['name', 'detail', 'degree', 'learn_times', 'students']
    list_filter = ['name', 'detail', 'degree', 'learn_times', 'students']


xadmin.site.register(Course, CourseAdmin)


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


xadmin.site.register(Lesson, LessonAdmin)


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']

xadmin.site.register(Video, VideoAdmin)


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course__name', 'name', 'download', 'add_time']

xadmin.site.register(CourseResource, CourseResourceAdmin)

