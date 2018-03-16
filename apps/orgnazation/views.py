from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponse

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


from .models import CourseOrg, CityDict

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
        all_courses = course_org.course_set.all()[:3]
        all_teacher = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html', {
            'course_org': course_org,
            'all_courses': all_courses,
            'all_teacher': all_teacher,
            'current_page': current_page
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
        exist_records = UserFavorite.objects.filter(user=request, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            # 如果记录存在，则为取消收藏
            exist_records.delete()
            return HttpResponse('{"status":"success", "msg": "取消收藏成功！"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                return HttpResponse('{"status":"success", "msg": "收藏成功！"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg": "收藏出错！"}', content_type='application/json')
