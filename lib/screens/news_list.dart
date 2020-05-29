import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_source.dart';

class NewsList extends StatelessWidget {
  final String sourceName;
  NewsList({this.sourceName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Source.sourceList.length,
      itemBuilder: (context, index) {
        return NewsItem();
      },
    );
  }
}

class NewsItem extends StatelessWidget {
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
              Image.network(
                  'https://ichef.bbci.co.uk/news/1024/branded_news/36AA/production/_112549931_p08fjpzs.jpg'),

              Text(
                'CNN journalist arrested live on air',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              Text(
                  'Omar Jimenez was reporting on protests in Minneapolis when he was detained by officers.')
            ],
          ),
        ),
      ),
    );
  }
}
