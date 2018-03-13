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
import xadmin

from users.views import LoginView, RegisterView, ActivateUserView, ForgetPwdView, ResetView, ModifyPwdView


urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('index/', TemplateView.as_view(template_name="index.html"), name="index"),
    path('login/', LoginView.as_view(), name="login"),
    path('register/', RegisterView.as_view(), name="register"),
    path('captcha/', include('captcha.urls')),
    re_path(r'^activate/(?P<activate_code>.*)?$', ActivateUserView.as_view(), name='user_activate'),
    path('forget_pwd/', ForgetPwdView.as_view(), name='forget_pwd'),
    re_path('reset/(?P<activate_code>.*)?$', ResetView.as_view(), name="reset"),
    path('modify_pwd/', ModifyPwdView.as_view(), name='modify_pwd'),

]
