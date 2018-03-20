from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponse
from django.db.models import Q


from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course, CourseResource
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mxin_utils import LoginRequiredMixin


class CourseListView(View):
    def get(self, request):
        all_courses = Course.objects.all().order_by('-add_time')

        hot_courses = all_courses.order_by('-click_nums')[:3]

        # 课程搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_courses = all_courses.filter(Q(name__icontains=search_keywords)|Q(desc__contains=search_keywords)
                                             | Q(detail__icontains=search_keywords))

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

        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:3]
        else:
            relate_courses = []
        return render(request, 'course-detail.html', {
            'course': course,
            'relate_courses': relate_courses,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org
        })


class CourseInfoView(LoginRequiredMixin, View):
    """
    课程章节学习
    """
    def  get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        # 查询用户是否已经关联了课程
        related_course = UserCourse.objects.filter(request.user, course=course)
        if not related_course:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        # 通过指定课程 获取所有学习该课程的用户信息
        user_courses = UserCourse.objects.filter(course=course)
        # 取出学习课程的所有用户的id
        user_ids = [user_course.user.id for user_course in user_courses]
        # 通过所有学习该课程的用户id，取出用户学习的所有相关课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出学习课程的所有用户学习课程的id
        course_ids = [user_course.course.id for user_course in user_courses]
        # 获取学过其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html', {
            'course': course,
            'all_resources': all_resources,
            'relate_courses': relate_courses
        })


class CourseCommentView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_comment = CourseComments.objects.filter(course=course)
        return render(request, 'course-comment.html', {
            'course': course,
            'all_resources': all_resources,
            'all_comment': all_comment
        })


class AddCommentView(View):
    def post(self, request):
        # 判断登录状态
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail", "msg": "用户未登录！"}', content_type='application/json')
        course_id =request.POST.get('course_id', 0)
        comments = request.POST.get('comments', '')
        if int(course_id) > 0 and comments:
            course_comment = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comment.course = course
            course_comment.comments = comments
            course_comment.user = request.user
            course_comment.save()
            return HttpResponse('{"status":"success", "msg": "评论成功！"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg": "评论出错！"}', content_type='application/json')

