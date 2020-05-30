import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/source.dart';
import 'package:news_app_flutter/models/article.dart';
import 'details_page.dart';

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
    return GestureDetector(
      onTap: () {
        print(model.url);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(url: model.url)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 7.0,
                spreadRadius: 5.0,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //chech if the image url is not null
                Image.network(model.urlToImage),

                //title of the article
                Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),

                //description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    model.desc,
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                //date
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child:
                      Text(model.date, style: TextStyle(color: Colors.black54)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
