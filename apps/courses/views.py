from django.shortcuts import render
from django.views.generic.base import View

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course


class CourseListView(View):
    def get(self, request):
        all_courses = Course.objects.all().order_by('-add_time')

        hot_courses = all_courses.order_by('-click_nums')[:3]

        #  课程排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_courses.order_by('-students')
            elif sort == 'hot':
                all_orgs = all_courses.order_by('-click_nums')

        # 课程机构分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(all_courses, 3, request=request)

        paged_courses = p.page(page)
        return render(request, 'course-list.html',{
            'paged_courses': paged_courses,
            'sort': sort,
            'hot_courses': hot_courses
        })


class CourseDetailView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        #  增加课程点击数
        course.click_nums += 1
        course.save()
        return render(request, 'course-detail.html', {
            'course': course
        })
