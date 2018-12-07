from django.shortcuts import render
from django.http import HttpResponse
from .models import Book
from django.views.decorators.http import require_http_methods
from django.core import serializers
from django.http import JsonResponse
import json

# Create your views here.
def index(request):
    # return HttpResponse('Hello World!')
    # 设置页面跳转
    return render(request,'index.html')

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