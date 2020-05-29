import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/news_list.dart';
import 'package:news_app_flutter/models/source.dart';

class SourceList {
  //list of sources
  static List<Source> sourceList = [
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

  //returns the list to be displayed on the tabs
  static List<Tab> getTabsList() {
    List<Tab> tabs = [];
    for (Source s in SourceList.sourceList) {
      tabs.add(Tab(
        child: Text(
          s.name,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }
    return tabs;
  }

  //returns the pages[NewsList] to be displayed as per the tabs
  static List<NewsList> getNewsList() {
    List<NewsList> newsList = [];
    for (Source s in SourceList.sourceList)
      newsList.add(
        NewsList(source: s),
      );

    return newsList;
  }
}
