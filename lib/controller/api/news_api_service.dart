import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApi {
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
          
        }
      });
    }
  }
}
