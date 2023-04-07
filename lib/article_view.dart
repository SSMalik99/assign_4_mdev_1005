import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String postUrl;
  const ArticleView({super.key,
    required this.postUrl
  });

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  // final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    WebViewController _web_controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.postUrl));

    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(controller: _web_controller)
      ),
    );
  }
}