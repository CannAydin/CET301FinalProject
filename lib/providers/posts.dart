import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
/* ChangeNotifier
  Allows us to establish behind the scenes communication tunnels with the help of the
  context object which we're getting in every widget.
 */
class Posts with ChangeNotifier {
  // ChangeNotifier bir klas ve bunu WITH ile extend ediyorum. Onun özelliklerini
  // klasımda kullanıyorum...
  // with birden fazla klasın özelliklerini çekmemi sağlayabilir.
  List<Post> _items = [
    /*Post(
        id: 'p1',
        username: 'test1',
        description: 'Istanbul',
        postDate: '11 05 2010',
        imageUrl:
          'https://i2.milimaj.com/i/milliyet/75/0x0/5f1afafb5542830cf0fb3b61.jpg'
      ),
      Post(
          id: 'p2',
          username: 'test2',
          description: 'Skopje',
          postDate: '11 05 2010',
          imageUrl:
          'https://turkishairlines.ssl.cdn.sdlmedia.com/637120900534921889AM.jpg'
      ),
      Post(
        id: 'p3',
        username: 'test3',
        description: 'Switzerland',
        postDate: '11 05 2010',
        imageUrl:
          'https://i.pinimg.com/originals/ae/bd/5f/aebd5f0eeacd1e234f0ac43e5e57cae6.jpg'
      ),
      Post(
          id: 'p4',
          username: 'test4',
          description: 'Istanbul',
          postDate: '11 05 2010',
          imageUrl:
          'https://i2.milimaj.com/i/milliyet/75/0x0/5e8198e455427e0b6c825148.jpg'
      ),
      Post(
        id: 'p5',
        username: 'test5',
        description: 'France',
        postDate: '11 05 2010',
        imageUrl:
          'https://travel.mqcdn.com/mapquest/travel/wp-content/uploads/2020/10/Provence-france-lavender-fields.jpg'
      ),
      Post(
          id: 'p6',
          username: 'test6',
          description: 'London',
          postDate: '11 05 2010',
          imageUrl:
          'https://assets.londonist.com/uploads/2016/10/i875/primrose.jpg'
      ),
      Post(
          id: 'p7',
          username: 'test7',
          description: 'Arakura Sengen Park',
          postDate: '11 05 2010',
          imageUrl:
          'https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/08/Red-Pagoda-in-Fujiyoshida-Japan.jpg'
      ),*/
  ];

  List<Post> get items {
    return [..._items];
  }

  Post findById(String id) {
    return _items.firstWhere((element) => element.id == id);
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
            postDate: postValue['postDate'].substring(0, 16)
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
      'username' : 'test1',
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