"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, re_path, include
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin

from users.views import LoginView, RegisterView, ActivateUserView, ForgetPwdView, ResetView, ModifyPwdView, LogoutView, IndexView
from MxOnline.settings import MEDIA_ROOT


urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('', IndexView.as_view(), name="index"),
    path('login/', LoginView.as_view(), name="login"),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('register/', RegisterView.as_view(), name="register"),
    path('captcha/', include('captcha.urls')),
    re_path(r'^activate/(?P<activate_code>.*)?$', ActivateUserView.as_view(), name='user_activate'),
    path('forget_pwd/', ForgetPwdView.as_view(), name='forget_pwd'),
    re_path('reset/(?P<activate_code>.*)?$', ResetView.as_view(), name="reset"),
    path('modify_pwd/', ModifyPwdView.as_view(), name='modify_pwd'),

    # 配置上传文件的访问处理函数
    re_path('media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),
    #re_path('static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),

    # 课程机构配置
    path('org/', include('orgnazation.urls', namespace='org')),
    # 课程相关配置
    path('course/', include('courses.urls', namespace='course')),
    # 用户中心相关配置
    path('user/', include('users.urls', namespace='user')),

]

# 全局404配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'