import 'package:news_app_flutter/models/news_source.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: Source.sourceList.length, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //The top NEWS text
              Container(
                alignment: Alignment.center,
                child: Text('News',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        fontFamily: 'Roboto-Black')),
              ),

              //the greeting and Choose category
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey Yash!',
                        style: TextStyle(color: Colors.black54, fontSize: 20.0),
                      ),
                      Text('Discover latest\nNews',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40.0))
                    ],
                  ),
                ),
              ),

              //the tabbar
              Container(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: Source.getTabsList(),
                  onTap: (index) {
                    //print(sources[index]);
                    //make a request to the
                  },
                ),
              ),

              //the list of news from the source
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: Source.getNewsList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
