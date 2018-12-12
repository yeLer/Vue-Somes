# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('book_name', models.CharField(max_length=64)),
                ('add_time', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='HomeLunbo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('img_url', models.CharField(max_length=100)),
                ('discription', models.CharField(max_length=100)),
                ('url_link', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='NewsComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('user_name', models.CharField(verbose_name='用户名', max_length=30)),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('content', models.CharField(verbose_name='评论内容', max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='NewsInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=100)),
                ('click_times', models.IntegerField(verbose_name='点击次数')),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('content', models.CharField(verbose_name='内容', max_length=3000)),
            ],
        ),
        migrations.CreateModel(
            name='NewsList',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=100)),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('summary', models.CharField(verbose_name='摘要', max_length=100, null=True)),
                ('click_times', models.IntegerField(verbose_name='点击次数')),
                ('url_link', models.CharField(verbose_name='图片链接', max_length=200)),
            ],
        ),
        migrations.AddField(
            model_name='newscomment',
            name='Comment_New',
            field=models.ForeignKey(to='myapp.NewsInfo'),
        ),
    ]
