import 'package:cet301finalproject/models/post.dart';
import 'package:cet301finalproject/providers/posts.dart';
import 'package:flutter/material.dart';
import '../Screens/person_detail_screen.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Post>(
      builder: (ctx, post, child) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  PersonDetailScreen.routeName, arguments: post.username,
                );
              },
              child: Text(
                post.username,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.10
                ),
              ),
            ),
          ),
          Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
            height: 280,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon:
                  post.isLiked ?
                  Icon(
                      Icons.favorite,
                      color: Colors.red
                  )
                      :
                  Icon(
                      Icons.favorite_outline_sharp,
                      color: Colors.black54
                  ),
                  onPressed: () {
                    post.toggleIsLiked();
                    Provider.of<Posts>(context, listen: false).likePost(post.id);
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  post.description,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    post.postDate
                ),
              )
            ],
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}
