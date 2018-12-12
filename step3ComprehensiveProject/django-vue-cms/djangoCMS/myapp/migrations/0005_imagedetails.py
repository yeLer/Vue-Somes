# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0004_photoinfo'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImageDetails',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('title', models.CharField(verbose_name='标题', max_length=80, null=True)),
                ('img_src', models.CharField(verbose_name='小图片', max_length=80)),
                ('img_msrc', models.CharField(verbose_name='大图片', max_length=80)),
                ('alt', models.CharField(verbose_name='描述', max_length=80, null=True)),
                ('catgory', models.ForeignKey(to='myapp.PhotoInfo')),
            ],
        ),
    ]
