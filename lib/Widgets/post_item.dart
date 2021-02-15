import 'package:cet301finalproject/models/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Screens/person_detail_screen.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    return Consumer<Post>(
      builder: (ctx, post, child) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  PersonDetailScreen.routeName, arguments: post.id,
                );
                /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => PersonDetailScreen.routeName
                  ),
              );*/
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
                    DateFormat('dd MM yyyy').format(post.postDate)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
