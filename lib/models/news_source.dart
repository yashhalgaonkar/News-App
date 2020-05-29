import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_item.dart';
import 'package:news_app_flutter/utils/network_helper.dart';
import 'package:news_app_flutter/screens/news_list.dart';

final String BASE_URL1 =
    'http://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a1611e9c9df34d9ca08d4536977f8489';
final String BASE_URL = 'http://newsapi.org/v2/top-headlines?sources=';

class Source {
  Source({this.id, this.name});
  String id;
  String name;

  static List<Source> sourceList = [
    Source(id: 'bloomberg', name: 'Bloomberg'),
    Source(id: 'buzzfeed', name: 'Buzzfeed'),
    Source(id: 'cnn', name: 'CNN'),
    Source(id: 'espn', name: 'ESPN'),
    Source(id: 'fortune', name: 'Fortune'),
    Source(id: 'fox-news', name: 'Fox News'),
    Source(id: 'google-news', name: 'Google News'),
    Source(id: 'mtv-news', name: 'MTV-News'),
    Source(id: 'national-geographic', name: 'National Geographic'),
    Source(id: 'new-scientist', name: 'New Scientist'),
    Source(id: 'new-york-magazine', name: 'New York Magazine'),
    Source(id: 'the-american-conservative', name: 'The American Conservative'),
    Source(id: 'the-huffington-post', name: 'The Huffington Post'),
    Source(id: 'the-verge', name: 'The Verge'),
    Source(id: 'the-wall-street-journal', name: 'The Wall Street Journal'),
    Source(id: 'the-washington-post', name: 'The Washington Post'),
    Source(id: 'the-washington-times', name: 'The Washington Times'),
  ];

  static List<Tab> getTabsList() {
    List<Tab> tabs = [];
    for (Source s in Source.sourceList) {
      tabs.add(Tab(
        child: Text(
          s.name,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }
    return tabs;
  }

  static List<NewsList> getNewsList() {
    List<NewsList> newsList = [];
    for (Source s in Source.sourceList)
      newsList.add(NewsList(
        sourceName: s.name,
      ));

    return newsList;
  }

  static String getDate(String utc) {
    var date = DateTime.parse(utc);
    return '${date.day}/${date.month}/${date.year}\n${date.hour} ${date.month}';
  }

  static Future<List<NewsItemModel>> getAllNewsItem(String sourceID) async {
    print('Get all news itesm called with source $sourceID');
    NetwrokHelper helper = NetwrokHelper(
        url: BASE_URL + sourceID + '&apiKey=a1611e9c9df34d9ca08d4536977f8489');
    var data = await helper.makeRequest();
    int totalResults = data['totalResults'];
    print('total results: $totalResults');
    List<NewsItemModel> newsitems = [];

    for (int i = 0; i < totalResults; i++) {
      var artical = data['articles'][0];
      NewsItemModel item = NewsItemModel(
          author: artical['author'],
          title: artical['title'],
          desc: artical['description'],
          url: artical['url'],
          urlToImage: artical['urlToImage'],
          publishedAt: artical['publishedAt'],
          date: getDate(artical['publishedAt']));

      newsitems.add(item);
    }
    return newsitems;
  }
}
