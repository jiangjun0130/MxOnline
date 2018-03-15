from django.shortcuts import render
from django.views.generic.base import View

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


from .models import CourseOrg, CityDict

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