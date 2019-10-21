import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DetailNews.dart';

class Headline extends StatefulWidget {
  @override
  _HeadlineState createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  final String url =
      "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=";
  List newsData;
  bool isLoading = true;
  String nurl;

  Future getNews() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "Application/json"});
    List data = json.decode(response.body)['articles'];
    setState(() {
      newsData = data;
      isLoading = false;
    });
    // print(newsData);
  }

  navigateToDetailScreen(nurl) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailNews(nurl);
    }));
  }

  @override
  void initState() {
    super.initState();
    this.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: newsData != null ? newsData.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Image(
                                height: 300.0,
                                image:
                                    NetworkImage(newsData[index]['urlToImage']),
                                fit: BoxFit.fill),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              newsData[index]['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              newsData[index]['description'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(6.0),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(
                                  "PublishedAt: ${newsData[index]['publishedAt']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(
                                  "Source: ${newsData[index]['source']['name']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  "Full Story",
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                onPressed: () {
                                  navigateToDetailScreen(
                                      newsData[index]['url']);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
