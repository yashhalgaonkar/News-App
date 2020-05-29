import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_page.dart';
import 'screens/details_page.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: HomePage.id,
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        HomePage.id: (context) => HomePage(),
        DetailsPage.id: (context) => DetailsPage()
      },
    );
  }
}
