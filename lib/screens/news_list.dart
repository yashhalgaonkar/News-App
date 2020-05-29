import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/source.dart';
import 'package:news_app_flutter/models/article.dart';

class NewsList extends StatefulWidget {
  //the source object passed
  final Source source;
  NewsList({this.source});

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  //list of all the articles from the source
  List<Article> newsArticles = [];

  @override
  void initState() {
    super.initState();
    widget.source.getArticles().then((value) {
      setState(() {
        newsArticles = value;
        print('lenght of  articles in set state: ${value.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('Number of articles: ${newsArticles.length}');
    return ListView.builder(
      itemCount: newsArticles.length,
      itemBuilder: (context, index) {
        return NewsItem(newsArticles[index]);
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
            border: Border.all(color: Colors.blue.shade400, width: 2.0),
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
