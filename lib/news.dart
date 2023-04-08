import 'package:assig_4_mdev_1005/news_tile.dart';
import 'package:assig_4_mdev_1005/services/news_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

// Define a custom Form widget.
class NewsState extends StatefulWidget {
  const NewsState({super.key});

  @override
  State<NewsState> createState() => NewScreen();
}

/// The home screen
class NewScreen extends State<NewsState> {
  /// Constructs a [NewScreen]

  bool _loading = false;

  List newsList = [];

  @override
  void initState() {

    _loading = true;
    super.initState();
    getNews();
  }

  void getNews() async {
    NewsAPI news = NewsAPI();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('News')),
        body: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsTile(
                imgUrl: newsList[index].urlToImage ?? "",
                title: newsList[index].title ?? "",
                desc: newsList[index].description ?? "",
                content: newsList[index].content ?? "",
                posturl: newsList[index].articleUrl ?? "",
              );
            }
        )
    );
  }
}