from django.shortcuts import render
from django.views.generic.base import View

from .models import CourseOrg, CityDict

class OrgView(View):
    """
        课程机构列表
    """
    def get(self, request):
        # 机构
        all_orgs = CourseOrg.objects.all()
        org_nums = all_orgs.count()
        # 城市
        all_citys = CityDict.objects.all()
        return render(request, 'org-list.html', {
            'all_orgs': all_orgs,
            'all_citys': all_citys,
            'org_nums': org_nums
        })