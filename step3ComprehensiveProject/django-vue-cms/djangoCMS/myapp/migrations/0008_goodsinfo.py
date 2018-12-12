# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0007_getgoodslunbo'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=80, null=True)),
                ('add_time', models.DateTimeField(verbose_name='添加时间', auto_now_add=True)),
                ('goods_no', models.CharField(verbose_name='存货码', max_length=80)),
                ('catgory', models.ForeignKey(to='myapp.GoodsList')),
            ],
        ),
    ]
