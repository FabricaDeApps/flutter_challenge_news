// To parse this JSON data, do
//
//     final responseNews = responseNewsFromJson(jsonString);

import 'dart:convert';

import 'package:example_news/models/article_model.dart';

ResponseNews responseNewsFromJson(String str) =>
    ResponseNews.fromJson(json.decode(str));

String responseNewsToJson(ResponseNews data) => json.encode(data.toJson());

class ResponseNews {
  String status;
  int totalResults;
  List<Article> articles;

  ResponseNews({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ResponseNews.fromJson(Map<String, dynamic> json) => ResponseNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
