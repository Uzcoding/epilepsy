import 'package:flutter/material.dart';

class News {
  int id;
  String category;
  String title;
  String short;
  String link;
  String image;
  String date;

  News({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.short,
    @required this.link,
    @required this.image,
    @required this.date,
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    title = json['title'];
    short = json['short'];
    link = json['link'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['title'] = this.title;
    data['short'] = this.short;
    data['link'] = this.link;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}
