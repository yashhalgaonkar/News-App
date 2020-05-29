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
        return Text('$sourceName: $index');
      },
    );
  }
}
