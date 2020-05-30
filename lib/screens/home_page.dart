import 'package:news_app_flutter/models/source_list.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/news_list.dart';

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
    //
    //initialize the tab controller
    _tabController = TabController(
        vsync: this, length: SourceList.sourceList.length, initialIndex: 0);
  }

  Future<List<NewsList>> getList() async {
    return SourceList.getNewsList();
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
                      Text('Discover latest\nNews Here',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35.0))
                    ],
                  ),
                ),
              ),

              //the tabbar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: SourceList.getTabsList(),
                    onTap: (index) {},
                  ),
                ),
              ),

              //the list of news from the source
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: SourceList.getNewsList(),
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
