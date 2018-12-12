# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0005_imagedetails'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsList',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=80, null=True)),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('summary', models.CharField(verbose_name='摘要', max_length=200)),
                ('click_times', models.IntegerField(verbose_name='点击次数')),
                ('img_src', models.CharField(verbose_name='图片url', max_length=80)),
                ('sell_price', models.FloatField()),
                ('market_price', models.FloatField()),
                ('stock_quantity', models.IntegerField()),
            ],
        ),
    ]
