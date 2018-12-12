# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_imagecategory'),
    ]

    operations = [
        migrations.CreateModel(
            name='PhotoLists',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='图片标题', max_length=50)),
                ('img_url', models.CharField(verbose_name='图片路径', max_length=100)),
                ('summary', models.CharField(verbose_name='摘要', max_length=200)),
                ('catgory', models.ForeignKey(to='myapp.ImageCategory')),
            ],
        ),
    ]
