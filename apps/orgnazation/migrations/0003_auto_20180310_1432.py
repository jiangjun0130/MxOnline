# Generated by Django 2.0 on 2018-03-10 14:32

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orgnazation', '0002_auto_20180310_1401'),
    ]

    operations = [
        migrations.AlterField(
            model_name='citydict',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间'),
        ),
        migrations.AlterField(
            model_name='citydict',
            name='desc',
            field=models.CharField(max_length=200, verbose_name='城市描述'),
        ),
        migrations.AlterField(
            model_name='citydict',
            name='name',
            field=models.CharField(max_length=20, verbose_name='城市名称'),
        ),
    ]
