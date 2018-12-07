from django.db import models

# Create your models here.
class Book(models.Model):
    book_name = models.CharField(max_length=64)
    add_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.book_name

    # 模型类对象的创建,在视图层通过管理器对象
    # book = Book.create(book_name=book_name,add_time=add_time)快速调用完成对象添加，
    # 然后调用book.save()保存到数据库
    @classmethod
    def create(self,book_name):
        obj = Book()
        obj.book_name = book_name
        return obj