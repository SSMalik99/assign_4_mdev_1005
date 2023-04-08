
import 'package:assig_4_mdev_1005/Model/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;


/// API service for the data of news from the internet
class NewsAPI {

  List<Article> news  = [];

  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f13c77a2fc4d456e8eeb16ac4b68abe5";

    Uri ur1 = Uri(
        scheme: "https",
        host: "newsapi.org",
        path: "v2/top-headlines",
        queryParameters: { "country" : "us", "apiKey" : "f13c77a2fc4d456e8eeb16ac4b68abe5"  }
    );

    var response = await http.get(ur1);

    // developer.log(ur1);
    //print(ur1);
    //developer.log(response.body.toString());
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'] ?? "N/A",
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"] ?? "N/A",
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}