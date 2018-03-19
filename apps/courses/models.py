from datetime import  datetime
from django.db import models

from orgnazation.models import CourseOrg, Teacher


class Course(models.Model):
    DEGREE_TYPE = (
        ('cj', '初级'),
        ('zj', '中级'),
        ('gj', '高级')
    )
    course_org = models.ForeignKey(CourseOrg, on_delete=models.CASCADE, verbose_name='课程机构', null=True, blank=True)
    name = models.CharField("课程名称", max_length=100)
    desc = models.CharField("课程描述", max_length=300)
    detail = models.TextField("课程详情")
    degree = models.CharField("课程难度", choices=DEGREE_TYPE, max_length=2)
    learn_times = models.IntegerField("学习时长（分钟）", default=0)
    students = models.IntegerField("学习人数", default=0)
    fav_nums = models.IntegerField("收藏人数", default=0)
    image = models.ImageField("封面图", upload_to="course/%Y/%m", max_length=100)
    click_nums = models.IntegerField("点击数", default=0)
    category = models.CharField("课程类别", max_length=20, default='后端开发')
    tag = models.CharField("课程标签", default="", max_length=10)
    teacher = models.ForeignKey(Teacher, verbose_name='讲师', null=True, blank=True, on_delete=models.CASCADE)
    need_known = models.CharField('课程须知', max_length=100, default='')
    teacher_tells = models.CharField('能学到什么', max_length=100, default='')
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_zj_nums(self):
        # 获取课程章节数
        return self.lesson_set.all().count()

    def get_learn_users(self):
        learn_users = self.usercourse_set.all()[:5]
        return learn_users

    def get_course_lesson(self):
        """
        获取课程所有章节
        :return:
        """
        return self.lesson_set.all()


class Lesson(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField("章节名称", max_length=100)
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name="章节"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_video(self):
        # 获取章节视频
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE)
    name = models.CharField("视频名称", max_length=100)
    url = models.CharField('视频地址', max_length=100, default='')
    learn_times = models.IntegerField("学习时长（分钟）", default=0)
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name="视频"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField("名称", max_length=100)
    download = models.FileField("资源文件", upload_to="course/resource/%Y/%m", max_length=100)
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name="课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name