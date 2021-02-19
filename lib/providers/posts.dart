import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Posts with ChangeNotifier {
  // ChangeNotifier bir klas ve bunu WITH ile extend ediyorum. Onun özelliklerini
  // klasımda kullanıyorum...
  // with birden fazla klasın özelliklerini çekmemi sağlayabilir.
  List<Post> _items = [];

  List<Post> get items {
    return [..._items];
  }

  Post findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Post> findByUsername(String username) {
    List<Post> postOfOneUSer = [];
    for(int i = 0; i < _items.length ; i++ ){
      if(_items[i].username == username){
        postOfOneUSer.add(_items[i]);
      }
    }
    return postOfOneUSer;
  }

  Future<void> getPostsFromServer() async {
    const url = 'https://cet301-374cc-default-rtdb.firebaseio.com/posts.json';
    try{
      final response = await http.get(url);
      //print(jsonDecode(response.body));
      final pulledData = json.decode(response.body) as Map<String, dynamic>;
      final List<Post>loadedPosts = [];
      pulledData.forEach((postId, postValue) {
        loadedPosts.add(Post(
            id: postId,
            username: postValue['username'],
            description: postValue['description'],
            imageUrl: postValue['imageUrl'],
            isLiked: postValue['isLiked'],
            postDate: postValue['postDate'].substring(0, 10)
        ));
      });
      _items = loadedPosts.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw (error);
    }

  }

  void addPost(Post post) {
    const url = 'https://cet301-374cc-default-rtdb.firebaseio.com/posts.json';
    http.post(url, body: json.encode({
      'username' : post.username,
      'description' : post.description,
      'imageUrl' : post.imageUrl,
      'isLiked' : post.isLiked,
      'postDate' : DateTime.now().toString(),
    }),
    ).then((response) {
      final newPost = Post(
          username: post.username,
          description: post.description,
          postDate: DateTime.now().toString(),
          imageUrl: post.imageUrl,
          id : DateTime.now().toString()
      );
      _items.add(newPost);
      notifyListeners();
    });
  }

  Future<void> likePost(String id) {
    final theIndex = _items.indexWhere((element) => element.id == id);
    final Post thePost = _items[theIndex];
    if(theIndex >= 0 ) {
      final url = 'https://cet301-374cc-default-rtdb.firebaseio.com/posts/$id.json';
      http.patch(url, body: json.encode({
        'isLiked' : thePost.isLiked
      }));
      notifyListeners();
    }
  }

  void deletePost(String id) {
    final url = 'https://cet301-374cc-default-rtdb.firebaseio.com/posts/$id.json';
    http.delete(url);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

}