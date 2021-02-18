import 'package:flutter/material.dart';

class Post with ChangeNotifier{
  final String id;
  final String username;
  final String description;
  final String postDate;
  final String imageUrl;
  bool isLiked;

  Post({
    this.id,
    this.username,
    this.description,
    this.postDate,
    this.imageUrl,
    this.isLiked = false
  });

  void toggleIsLiked(){
    isLiked = !isLiked;
    notifyListeners();
  }
}