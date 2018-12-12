from django.shortcuts import render
from django.http import HttpResponse
from .models import Book
from . import models
from django.views.decorators.http import require_http_methods
from django.core import serializers
from django.http import JsonResponse
import json
# 导入分页相关的包
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
def index(request):
    # return HttpResponse('Hello World!')
    # 设置页面跳转
    return render(request, 'index.html')


# 声明被装饰的视图仅支持GET方法
@require_http_methods(["GET"])
def add_book1(request):
    response = {}
    try:
        book = Book(book_name=request.GET.get('book_name'))
        book.save()
        response['msg'] = 'success'
        response['error_num'] = 0
    except  Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


# 声明被装饰的视图仅支持POST方法
@require_http_methods(["POST"])
def add_book(request):
    response = {}
    if request.method == "POST":
        try:
            book_name = request.POST['book_name']
            book = Book.create(book_name=book_name)
            book.save()
            response['book_name'] = book_name
            response['msg'] = 'success'
            response['error_num'] = 0
        except Exception as e:
            response['msg'] = str(e)
            response['error_num'] = 1

        return JsonResponse(response)
    else:
        return HttpResponse("error not is request by POST")


@require_http_methods(["GET"])
def show_books(request):
    response = {}
    try:
        books = Book.objects.filter()
        response['list'] = json.loads(serializers.serialize("json", books))
        response['msg'] = 'success'
        response['error_num'] = 0
    except  Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def del_book(request):
    response = {}
    try:
        book_id = request.GET.get('id')
        Book.objects.filter(id=book_id).delete()
        response['msg'] = 'success'
        response['status'] = 0

    except  Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getlunbo(request):
    response = {}
    try:
        lunbo = models.HomeLunbo.objects.all()
        response['message'] = json.loads(serializers.serialize("json", lunbo))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getNewsList(request):
    response = {}
    try:
        newslist = models.NewsList.objects.all()
        response['message'] = json.loads(serializers.serialize("json", newslist))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getNewsInfo(request, id):
    response = {}
    s_id = int(id)
    try:
        newsInfo = models.NewsInfo.objects.filter(id=s_id)
        response['message'] = json.loads(serializers.serialize("json", newsInfo))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1
    return JsonResponse(response)


@require_http_methods(["GET"])
def getComments(request, id):
    page_num = request.GET.get('pageindex')  # 第几页
    # pageSize = int(request.GET.get('pageSize'))
    pageSize = int(6)  # 后端定义页大小为6个
    response = {}
    s_id = int(id)  # 这是对应新闻的id
    try:
        newsComments = models.NewsComment.objects.filter(Comment_New_id=s_id)
        paginator = Paginator(newsComments, pageSize)
        response['total'] = paginator.count
        try:
            comments = paginator.page(page_num)
        except PageNotAnInteger:
            comments = paginator.page(1)
        except EmptyPage:
            comments = paginator.page(paginator.num_pages)
        response['message'] = json.loads(serializers.serialize("json", comments))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1
    return JsonResponse(response)


@require_http_methods(["POST"])
def postComment(request, id):
    response = {}
    news_id = int(id)
    if request.method == "POST":
        try:
            userName = request.POST['userName']
            content = request.POST['content']
            comment = models.NewsComment.create(user_name=userName, content=content, Comment_New=news_id)
            print(userName, content, news_id)
            comment.save()
            response['msg'] = 'success'
            response['status'] = 0
        except Exception as e:
            response['msg'] = str(e)
            response['status'] = 1
        return JsonResponse(response)
    else:
        return HttpResponse("error not is request by POST")


@require_http_methods(["GET"])
def getImageCategory(request):
    response = {}
    try:
        newslist = models.ImageCategory.objects.all()
        response['message'] = json.loads(serializers.serialize("json", newslist))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getPhotoListByCategoryId(request, id):
    response = {}
    PhotoList_id = int(id)
    try:
        if (PhotoList_id == 0):
            PhotoList = models.PhotoLists.objects.all()
        else:
            PhotoList = models.PhotoLists.objects.filter(catgory_id=PhotoList_id)
        response['message'] = json.loads(serializers.serialize("json", PhotoList))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getImageInfo(request, id):
    response = {}
    image_id = int(id)
    try:
        ListsInfo = models.PhotoInfo.objects.filter(catgory_id=image_id)
        response['message'] = json.loads(serializers.serialize("json", ListsInfo))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getThumbs(request, id):
    response = {}
    image_id = int(id)
    try:
        PhotoList = models.ImageDetails.objects.filter(catgory_id=image_id)
        response['message'] = json.loads(serializers.serialize("json", PhotoList))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getGoods(request):
    response = {}
    page_num = request.GET.get('pageindex')  # 第几页
    try:
        goods_list = models.GoodsList.objects.all()
        response['message'] = json.loads(serializers.serialize("json", goods_list))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def getGoodsLunBo(request, id):
    response = {}
    image_id = int(id)
    try:
        lunbo_list = models.getGoodsLunBo.objects.filter(catgory_id=image_id)
        response['message'] = json.loads(serializers.serialize("json", lunbo_list))
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)


@require_http_methods(["GET"])
def get_goods_info(request, id):
    response = {}
    goods_id = int(id)
    try:
        goods_info = models.GoodsInfo.objects.filter(catgory_id=goods_id)
        for item in goods_info:
            title = item.title
            goods_no = item.goods_no
            stock_quantity = item.catgory.stock_quantity  # 根据外键获取关联表的数据
            sell_price = item.catgory.sell_price  # 根据外键获取关联表的数据
            market_price = item.catgory.market_price
            add_time = item.add_time
        response['message'] = {
            "title": title,
            "goods_no": goods_no,
            "stock_quantity": stock_quantity,
            "sell_price": sell_price,
            "add_time": add_time,
            "market_price":market_price
        }
        response['msg'] = 'success'
        response['status'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['status'] = 1

    return JsonResponse(response)
