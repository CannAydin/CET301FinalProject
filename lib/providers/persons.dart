import 'package:flutter/cupertino.dart';
import '../models/post.dart';
/* ChangeNotifier
  Allows us to establish behind the scenes communication tunnels with the help of the
  context object which we're getting in every widget.
 */

class Persons with ChangeNotifier {
  // ChangeNotifier bir klas ve bunu WITH ile extend ediyorum. Onun özelliklerini
  // klasımda kullanıyorum...
  // with birden fazla klasın özelliklerini çekmemi sağlayabilir.
    List<Post> _items = [
      Post(
        id: 'p1',
        username: 'test1',
        description: 'Istanbul',
        postDate: new DateTime.utc(1944, 06, 15),
        imageUrl:
          'https://i2.milimaj.com/i/milliyet/75/0x0/5f1afafb5542830cf0fb3b61.jpg'
      ),
      Post(
          id: 'p2',
          username: 'test2',
          description: 'Skopje',
          postDate: new DateTime.utc(1944,06, 15),
          imageUrl:
          'https://turkishairlines.ssl.cdn.sdlmedia.com/637120900534921889AM.jpg'
      ),
      Post(
        id: 'p3',
        username: 'test3',
        description: 'Switzerland',
        postDate: new DateTime.utc(DateTime.april),
        imageUrl:
          'https://i.pinimg.com/originals/ae/bd/5f/aebd5f0eeacd1e234f0ac43e5e57cae6.jpg'
      ),
      Post(
          id: 'p4',
          username: 'test4',
          description: 'Istanbul',
          postDate: new DateTime.utc(1944, 7, 6),
          imageUrl:
          'https://i2.milimaj.com/i/milliyet/75/0x0/5e8198e455427e0b6c825148.jpg'
      ),
      Post(
        id: 'p5',
        username: 'test5',
        description: 'France',
        postDate: new DateTime.utc(1944, 6, 6),
        imageUrl:
          'https://travel.mqcdn.com/mapquest/travel/wp-content/uploads/2020/10/Provence-france-lavender-fields.jpg'
      ),
      Post(
          id: 'p6',
          username: 'test6',
          description: 'London',
          postDate: new DateTime.utc(1944, 6, 6),
          imageUrl:
          'https://assets.londonist.com/uploads/2016/10/i875/primrose.jpg'
      ),
      Post(
          id: 'p7',
          username: 'test7',
          description: 'Arakura Sengen Park',
          postDate: new DateTime.utc(1944, 6, 6),
          imageUrl:
          'https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/08/Red-Pagoda-in-Fujiyoshida-Japan.jpg'
      ),
    ];

    List<Post> get items {
      return [..._items];
    }

    Post findById(String id) {
      return _items.firstWhere((element) => element.id == id);
    }

    void addPost(Post post) {
      final newPost = Post(
          username: post.username,
          description: post.description,
          postDate: post.postDate,
          imageUrl: post.imageUrl,
          id : DateTime.now().toString()
      );
      _items.add(newPost);
      notifyListeners();
    }
}

