from django.db import models


# Create your models here.
class Book(models.Model):
    book_name = models.CharField(max_length=64)
    add_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.book_name

    # 模型类对象的创建,在视图层通过管理器对象
    # book = Book.create(book_name=book_name)快速调用完成对象添加，
    # 然后调用book.save()保存到数据库
    @classmethod
    def create(self, book_name):
        obj = Book()
        obj.book_name = book_name
        return obj


class HomeLunbo(models.Model):
    img_url = models.CharField(max_length=100)
    discription = models.CharField(max_length=100)
    url_link = models.CharField(max_length=200)

    def __unicode__(self):
        return self.discription


class NewsList(models.Model):
    title = models.CharField('标题', max_length=100)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    summary = models.CharField('摘要', max_length=100, null=True)
    click_times = models.IntegerField('点击次数')
    url_link = models.CharField('图片链接', max_length=200)

    def __unicode__(self):
        return self.title


class NewsInfo(models.Model):
    title = models.CharField('标题', max_length=100)
    click_times = models.IntegerField('点击次数')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    content = models.CharField('内容', max_length=3000)

    def __unicode__(self):
        return self.title


class NewsComment(models.Model):
    user_name = models.CharField('用户名', max_length=30)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    content = models.CharField('评论内容', max_length=200)
    Comment_New = models.ForeignKey(NewsInfo)

    @classmethod
    def create(self, user_name, content, Comment_New):
        obj = NewsComment()
        obj.user_name = user_name
        obj.content = content
        # obj.Comment_New_id = Comment_New   #这里有个坑，一定是数据库里实际的属性名称，而不是自己定义的Comment_New
        obj.Comment_New_id = Comment_New
        return obj


class ImageCategory(models.Model):
    title = models.CharField('图片类别', max_length=30)

    def __unicode__(self):
        return self.title


class PhotoLists(models.Model):
    title = models.CharField('图片标题', max_length=50)
    img_url = models.CharField('图片路径', max_length=100)
    summary = models.CharField('摘要', max_length=200)
    catgory = models.ForeignKey(ImageCategory)

    def __unicode__(self):
        return self.title


class PhotoInfo(models.Model):
    title = models.CharField('图片标题', max_length=50)
    click_times = models.IntegerField('点击次数')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    content = models.CharField('内容', max_length=3000)
    catgory = models.ForeignKey(PhotoLists)

    def __unicode__(self):
        return self.title


class ImageDetails(models.Model):
    title = models.CharField('标题', max_length=80, null=True)
    img_src = models.CharField('小图片', max_length=80)
    img_msrc = models.CharField('大图片', max_length=80)
    alt = models.CharField('描述', max_length=80, null=True)
    catgory = models.ForeignKey(PhotoInfo)

    def __unicode__(self):
        return self.title


class GoodsList(models.Model):
    title = models.CharField('标题', max_length=80, null=True)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    summary = models.CharField('摘要', max_length=200)
    click_times = models.IntegerField('点击次数')
    img_src = models.CharField('图片url', max_length=80)
    sell_price = models.FloatField()
    market_price = models.FloatField()
    stock_quantity = models.IntegerField()

    def __unicode__(self):
        return self.title


class getGoodsLunBo(models.Model):
    title = models.CharField('标题', max_length=80, null=True)
    img_src = models.CharField('小图片', max_length=200)
    img_msrc = models.CharField('大图片', max_length=200)
    alt = models.CharField('描述', max_length=80, null=True)
    catgory = models.ForeignKey(GoodsList)

    def __unicode__(self):
        return self.title

class GoodsInfo(models.Model):
    title = models.CharField('标题', max_length=80, null=True)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)
    goods_no = models.CharField('存货码', max_length=80)
    catgory = models.ForeignKey(GoodsList)

    def __unicode__(self):
        return self.title