class CategoryModel {
  String? categoryName;

  CategoryModel({this.categoryName});
}

class NewsModel {
  String? title;
  String? discription;
  String? urlToImage;
  String? author;
  String? content;
  NewsModel(
      {this.title,
      this.discription,
      this.urlToImage,
      this.author,
      this.content});
}
