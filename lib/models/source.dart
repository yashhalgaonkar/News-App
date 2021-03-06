import 'package:news_app_flutter/models/article.dart';
import 'package:news_app_flutter/utils/network_helper.dart';

final String BASE_URL1 =
    'http://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a1611e9c9df34d9ca08d4536977f8489';
final String BASE_URL = 'http://newsapi.org/v2/top-headlines?sources=';

class Source {
  String name;
  String id;

  Source({this.name, this.id});

  String getDate(String utc) {
    var date = DateTime.parse(utc);
    DateTime local = date.toLocal();
    return 'Time: ${local.hour}:${local.minute}\nDate: ${local.day}/${local.month}/${local.year}';
  }

  bool isNotNull(Article article) {
    if (article.title == null ||
        article.desc == null ||
        article.date == null ||
        article.publishedAt == null ||
        article.url == null ||
        article.urlToImage == null)
      return false;
    else
      return true;
  }

  //return all the articles from that particular news source
  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    NetworkHelper helper = NetworkHelper(
        url: BASE_URL + id + '&apiKey=a1611e9c9df34d9ca08d4536977f8489');
    var data = await helper.makeRequest();

    //parse the json
    int totalResults = data['totalResults'];

    for (int i = 0; i < totalResults; i++) {
      var artData = data['articles'][i];

      Article article = Article(
          author: artData['author'],
          title: artData['title'],
          desc: artData['description'],
          url: artData['url'],
          publishedAt: artData['publishedAt'],
          urlToImage: artData['urlToImage'],
          date: getDate(artData['publishedAt']));

      //to check if any of the above property is not null
      if (isNotNull(article)) articles.add(article);
    }

    return articles;
  }
}
