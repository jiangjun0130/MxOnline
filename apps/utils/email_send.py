# -*- coding:utf-8 -*- 
__author__ = 'jiangjun'
__date__ = '2018/3/13 9:41 '

from random import Random

from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM


def send_register_email(email, send_type='R'):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ''
    email_body = ''
    if send_type == 'R':
        email_title = '慕学在线网注册激活邮件'
        email_body = '请点击下方链接进行激活账号：http://127.0.0.1:8000/activate/{0}'.format(code)
    elif send_type == 'F':
        email_title = '慕学在线网密码重置邮件'
        email_body = '请点击下方链接进行密码重置：http://127.0.0.1:8000/reset/{0}'.format(code)
    send_status = send_mail(subject=email_title, message=email_body, from_email=EMAIL_FROM, recipient_list=[email])
    if send_status:
        pass


def random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    return str
