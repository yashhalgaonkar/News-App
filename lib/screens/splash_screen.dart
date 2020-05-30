import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  static final String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3))
        .then((value) => {Navigator.pushNamed(context, HomePage.id)});

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'news_tag',
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.black,
            child: Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
