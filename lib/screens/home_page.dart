import 'news_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> sources = [
    'NDTV',
    'Aaj Tak',
    'ABP News',
    'News Nation',
    'CNBC',
    'TV9',
    'Daily Hunt',
    'YouTube',
    'Google News',
    'News API'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 10);
  }

  List<Tab> getTabsList() {
    List<Tab> tabs = [];
    for (String s in sources) {
      tabs.add(Tab(
        child: Text(
          s,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }
    return tabs;
  }

  List<NewsList> getNewsList() {
    List<NewsList> newsList = [];
    for (String s in sources)
      newsList.add(NewsList(
        sourceName: s,
      ));

    return newsList;
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
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
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
                  tabs: getTabsList(),
                  onTap: (index) {
                    print(sources[index]);
                  },
                ),
              ),

              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: getNewsList(),
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
