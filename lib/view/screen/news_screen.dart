import 'package:flutter/material.dart';
import 'package:news_app_api/controller/api/news_api_service.dart';
import 'package:news_app_api/model/category_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> airticles = [];
  getNews() async {
    NewsApi newsApi = NewsApi();
    await newsApi.getNews();
    airticles = newsApi.dataStore;
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App With Flutter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: airticles.length,
                itemBuilder: (context, index) {
                  final airticle = airticles[index];
                
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                          airticle.urlToImage!,
                              height: 250,
                              width: 400,
                              fit: BoxFit.cover,
                            ),
                          ) ,
                          Text(airticle.content!)
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
