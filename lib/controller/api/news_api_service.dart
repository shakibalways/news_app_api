import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_api/model/category_model.dart';

class NewsApi {
  List<NewsModel> dataStore = [];
  Future<void> getNews() async {
    var response = await http.get((Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=736b8dfb7f2f469594a2c4f96815423f")));
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            discription: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}
