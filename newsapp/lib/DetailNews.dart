import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNews extends StatefulWidget {
  final String nurl;
  DetailNews(
    this.nurl,
  );

  @override
  _DetailNewsState createState() => _DetailNewsState(nurl);
}

class _DetailNewsState extends State<DetailNews> {
  final String nurl;
  _DetailNewsState(
    this.nurl,
  );
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Story"),
      ),
      body: Center(
        child: Container(
          child: WebView(
            initialUrl: nurl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                isLoading = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
