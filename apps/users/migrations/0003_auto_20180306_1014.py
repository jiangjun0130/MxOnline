# Generated by Django 2.0 on 2018-03-06 10:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20180305_2251'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='userprofile',
            options={'verbose_name': '用户消息', 'verbose_name_plural': '用户消息'},
        ),
    ]