from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

class UserProfile(AbstractUser):
    GENDER_TYPE = (
        ('M', 'Male'),
        ('F', 'Female')
    )
    nick_name = models.CharField("user nick name", max_length=50,default="")
    birthday = models.DateField("birthday", null=True, blank=True)
    gender = models.CharField("gender", max_length=1, choices=GENDER_TYPE, default="F")
    address = models.CharField("address", max_length=100, default="")
    mobile = models.CharField("mobile", max_length=11, null=True, blank=True)
    image = models.ImageField("image",upload_to="image/%Y/%m", default="image/default.png", max_length=100)

    class Meta:
        verbose_name = "user info"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    SEND_EMAIL_TYPE = (
        ('R', 'register'),
        ('F', 'forget')
    )
    code = models.CharField('vertify code', max_length=20)
    email = models.EmailField('email address', max_length=50)
    send_type = models.CharField("send email type", choices=SEND_EMAIL_TYPE, max_length=1)
    send_time = models.DateTimeField("send email time", default=datetime.now)

    class Meta:
        verbose_name = "email vetify code"
        verbose_name_plural = verbose_name

class Banner(models.Model):
    title = models.CharField("title", max_length=100)
    image = models.ImageField("image", upload_to="banner/%Y/%m", max_length=100)
    url = models.URLField("image url", max_length=200)
    index = models.IntegerField("image show index", default=100)
    add_time = models.DateTimeField('image add time', default=datetime.now)

    class Meta:
        verbose_name = "idnex page page banner"
        verbose_name_plural = verbose_name
