import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final String sourceName;
  NewsList({this.sourceName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(sourceName),
      ),
    );
  }
}
