#!/usr/bin/env python
# encoding: utf-8
'''
@author: lele Ye
@contact: 1750112338@qq.com
@software: pycharm 2018.2
@file: urls.py
@time: 2018/11/19 10:30
@desc:
'''
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),#默认进入到主页
    url(r'^api/add_book$', views.add_book),
    url(r'^api/show_books$', views.show_books),
    url(r'^api/del_book', views.del_book),
]