# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0003_photolists'),
    ]

    operations = [
        migrations.CreateModel(
            name='PhotoInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='图片标题', max_length=50)),
                ('click_times', models.IntegerField(verbose_name='点击次数')),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('content', models.CharField(verbose_name='内容', max_length=3000)),
                ('catgory', models.ForeignKey(to='myapp.PhotoLists')),
            ],
        ),
    ]
