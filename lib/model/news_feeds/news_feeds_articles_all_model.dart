import 'package:flutter/cupertino.dart';

class NewsFeedsArticleListModel {
  String id;
  String typeName;
  String categoryName;
  String sort;
  String title;
  String description;
  String adsTitle;
  String articleDate;
  String createDate;
  String status;
  String action;

  NewsFeedsArticleListModel({
    required this.id,
    required this.typeName,
    required this.categoryName,
    required this.sort,
    required this.title,
    required this.description,
    required this.adsTitle,
    required this.articleDate,
    required this.createDate,
    required this.status,
    required this.action,
  });
}
