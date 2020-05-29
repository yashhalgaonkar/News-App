import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_item.dart';
import 'package:news_app_flutter/models/news_source.dart';

class NewsList extends StatelessWidget {
  final String sourceName;
  final String sourceID;
  NewsList({this.sourceName, this.sourceID});

  List<NewsItemModel> newsItems = [];

  void getAllNewsItems() async {
    newsItems = await Source.getAllNewsItem(sourceID);
  }

  @override
  Widget build(BuildContext context) {
    getAllNewsItems();

    print('Number of articles: ${newsItems.length}');
    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return NewsItem(newsItems[index]);
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  NewsItem(this.model);
  final NewsItemModel model;

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
