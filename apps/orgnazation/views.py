from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponse
from django.db.models import Q

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import CourseOrg, CityDict, Teacher

from .forms import UserAskForm
from courses.models import Course
from operation.models import UserFavorite


class OrgView(View):
    """
        课程机构列表
    """

    def get(self, request):
        # 机构
        all_orgs = CourseOrg.objects.all()
        hot_orgs = all_orgs.order_by('click_nums')[:3]

        # 取出筛选城市
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords) | Q(desc__contains=search_keywords))

        # 筛选类别
        category = request.GET.get('ct', '')
        if category:
            all_orgs = all_orgs.filter(category=category)

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.filter('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.filter('-course_nums')

        # 课程机构分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # Provide Paginator with the request object for complete querystring generation

        p = Paginator(all_orgs, 5, request=request)

        orgs = p.page(page)

        org_nums = all_orgs.count()
        # 城市
        all_citys = CityDict.objects.all()
        return render(request, 'org-list.html', {
            'orgs': orgs,
            'all_citys': all_citys,
            'org_nums': org_nums,
            'city_id': city_id,
            'category': category,
            'hot_orgs': hot_orgs,
            'sort': sort
        })


class AddUserAskView(View):
    """
        用户添加咨询
    """

    def post(self, request):
        user_ask_form = UserAskForm(request.POST)
        if user_ask_form.is_valid():
            user_ask = user_ask_form.save(commit=True)
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse("{'status': 'fail', 'msg': {0} }".format(user_ask_form.errors),
                                content_type='application/json')


class OrgHomeView(View):
    """
    机构首页
    """

    def get(self, request, org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))

        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        all_courses = course_org.course_set.all()[:3]
        all_teacher = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html', {
            'course_org': course_org,
            'all_courses': all_courses,
            'all_teacher': all_teacher,
            'current_page': current_page,
            'has_fav': has_fav
        })


class OrgCourseView(View):
    """
    机构课程列表页
    """

    def get(self, request, org_id):
        current_page = 'courses'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]
        return render(request, 'org-detail-course.html', {
            'course_org': course_org,
            'all_courses': all_courses,
            'current_page': current_page
        })


class OrgIntroduceView(View):
    def get(self, request, org_id):
        current_page = 'org_introduce'
        course_org = CourseOrg.objects.get(id=int(org_id))
        return render(request, 'org-detail-desc.html', {
            'course_org': course_org,
            'current_page': current_page
        })


class OrgTeacherView(View):
    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()
        return render(request, 'org-detail-teachers.html', {
            'course_org': course_org,
            'all_teachers': all_teachers,
            'current_page': current_page
        })


class AddFavView(View):
    """
    用户收藏，取消收藏
    """

    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        # 判断登录状态
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail", "msg": "用户未登录！"}', content_type='application/json')
        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            # 如果记录存在，则为取消收藏
            exist_records.delete()
            return HttpResponse('{"status":"success", "msg": "取消收藏成功！"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                return HttpResponse('{"status":"success", "msg": "收藏成功！"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg": "收藏出错！"}', content_type='application/json')


class TeacherListView(View):
    def get(self, request):
        all_teachers = Teacher.objects.all()

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) | Q(work_company__icontains=search_keywords)
                                               | Q(work_position__icontains=search_keywords))

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.filter('-click_nums')

        sorted_teachers = Teacher.objects.all().order_by('-click_nums')[:3]

        # 课程机构分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

            # Provide Paginator with the request object for complete querystring generation

        paginator = Paginator(all_teachers, 1, request=request)

        paged_teachers = paginator.page(page)
        return render(request, 'teachers-list.html', {
            'all_teachers': all_teachers,
            'paged_teachers': paged_teachers,
            'sorted_teachers': sorted_teachers
        })


class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()
        teacher_courses = Course.objects.filter(teacher=teacher)

        has_teacher_faved = False
        if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher.id):
            has_teacher_faved = True

        has_org_faved = False
        if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
            has_org_faved = True

        sorted_teachers = Teacher.objects.all().order_by('-click_nums')[:3]

        return render(request, 'teacher-detail.html', {
            'teacher': teacher,
            'teacher_courses': teacher_courses,
            'sorted_teachers': sorted_teachers,
            'has_teacher_faved': has_teacher_faved,
            'has_org_faved': has_org_faved
        })