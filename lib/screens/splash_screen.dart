import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static final String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'news_tag',
          child: Text(
            'News',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                fontFamily: 'Roboto-Black'),
          ),
        ),
      ),
    );
  }
}
