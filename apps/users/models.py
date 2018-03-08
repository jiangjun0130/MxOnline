from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser


class UserProfile(AbstractUser):
    GENDER_TYPE = (
        ('M', '男'),
        ('F', '女')
    )
    nick_name = models.CharField(verbose_name="user nick name", max_length=50,default="")
    birthday = models.DateField(verbose_name="birthday", null=True, blank=True)
    gender = models.CharField("gender", max_length=1, choices=GENDER_TYPE, default="F")
    address = models.CharField("address", max_length=100, default="")
    mobile = models.CharField("mobile", max_length=11, null=True, blank=True)
    image = models.ImageField("image",upload_to="image/%Y/%m", default="image/default.png", max_length=100)

    class Meta:
        verbose_name = "用户消息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    SEND_EMAIL_TYPE = (
        ('R', 'register'),
        ('F', 'forget')
    )
    code = models.CharField('验证码', max_length=20)
    email = models.EmailField('邮箱', max_length=50)
    send_type = models.CharField("发送类型", choices=SEND_EMAIL_TYPE, max_length=1)
    send_time = models.DateTimeField("发送时间", default=datetime.now)

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField("标题", max_length=100)
    image = models.ImageField("轮播图", upload_to="banner/%Y/%m", max_length=100)
    url = models.URLField("图片路径", max_length=200)
    index = models.IntegerField("顺序", default=100)
    add_time = models.DateTimeField('添加时间', default=datetime.now)

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name


class TestBug(models.Model):
    name = models.CharField('姓名', max_length=100)
    age = models.IntegerField('年龄')
    desc = models.CharField('描述', max_length=100)

    class Meta:
        verbose_name = "测试Bug"
        verbose_name_plural = verbose_name
