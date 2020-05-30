import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'screens/home_page.dart';
import 'screens/details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    //set prefered orientations
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: SplashScreen.id,
      routes: {
        '/': (context) => SplashScreen(),
        HomePage.id: (context) => HomePage(),
        DetailsPage.id: (context) => DetailsPage()
      },
    );
  }
}
