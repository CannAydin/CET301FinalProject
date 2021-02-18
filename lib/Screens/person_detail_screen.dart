import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';

class PersonDetailScreen extends StatelessWidget {
  //final String title;

  static const routeName = '/person-detail';

  //PersonDetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments as String;
    final thePosts = Provider.of<Posts>(
        context,
        listen: false,
    ).findById(postId);
    return Scaffold(
      appBar: AppBar(
        title: Text(thePosts.username),
      ),
      body: Container(
        width: double.infinity,
        height: 300,
        child: Image.network(
            thePosts.imageUrl,
            fit: BoxFit.cover,
        ),
      ),
    );
  }
}
