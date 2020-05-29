import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/article.dart';

class NewsList extends StatelessWidget {
  final List<Article> newsArticles;
  NewsList({this.newsArticles});

  @override
  Widget build(BuildContext context) {
    print('Number of articles: ${newsArticles.length}');
    return ListView.builder(
      itemCount: newsArticles.length,
      itemBuilder: (context, index) {
        return newsArticles.length == 0
            ? Center(child: Text('Ooops'))
            : NewsItem(newsArticles[index]);
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  NewsItem(this.model);
  final Article model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image
              Image.network(model.urlToImage),

              //title
              Text(
                model.title,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              //description
              Text(model.desc),

              //date
              Text(model.date)
            ],
          ),
        ),
      ),
    );
  }
}
