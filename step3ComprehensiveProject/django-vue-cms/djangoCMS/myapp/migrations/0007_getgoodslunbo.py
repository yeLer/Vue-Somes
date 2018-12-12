# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0006_goodslist'),
    ]

    operations = [
        migrations.CreateModel(
            name='getGoodsLunBo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=80, null=True)),
                ('img_src', models.CharField(verbose_name='小图片', max_length=200)),
                ('img_msrc', models.CharField(verbose_name='大图片', max_length=200)),
                ('alt', models.CharField(verbose_name='描述', max_length=80, null=True)),
                ('catgory', models.ForeignKey(to='myapp.GoodsList')),
            ],
        ),
    ]
