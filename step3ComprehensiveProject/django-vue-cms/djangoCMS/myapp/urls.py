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
from django.views.static import serve
from . import views
from djangoCMS import settings

urlpatterns = [
    url(r'^$', views.index),  # 默认进入到主页
    # 参考：https://www.cnblogs.com/Undo-self-blog/p/7904812.html
    # D:\pythonWorkSpace\django\djangoCMS\media\images\photoList
    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.BASE_DIR + '\media'}),  # 配置服务器端图片访问路径

    url(r'^api/getlunbo$', views.getlunbo),  # 获取轮播图
    url(r'^api/getNewsList$', views.getNewsList),  # 获取图文列表页
    url(r'^api/getNewsInfo/(\d+)$', views.getNewsInfo),  # 获取新闻详情页面
    url(r'^api/getComments/(\d+)$', views.getComments),  # 获取新闻评论
    url(r'^api/postComment/(\d+)$', views.postComment),  # 对新闻进行评论
    url(r'^api/getImageCategory$', views.getImageCategory),  # 图片分类
    url(r'^api/getPhotoListByCategoryId/(\d+)$', views.getPhotoListByCategoryId),  # 按照类别获取图片详情列表
    url(r'^api/getImageInfo/(\d+)$', views.getImageInfo),  # 按照图片id获取详情信息
    url(r'^api/getThumbs/(\d+)$', views.getThumbs),  # 按照详情信息id获取缩略图的图片
    url(r'^api/getGoods$', views.getGoods),  # 获取商品列表页面中的所有数据
    url(r'^api/getGoodsLunBo/(\d+)$', views.getGoodsLunBo),  # 按照商品id获取轮播图的图片
    url(r'^api/goods/get_goods_info/(\d+)$', views.get_goods_info),  # 按照商品id获取轮播图的图片
]
