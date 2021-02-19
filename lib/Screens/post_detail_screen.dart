import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';

class PostDetailScreen extends StatefulWidget{
  @override
  _PostDetailScreen createState() => _PostDetailScreen();
}

class _PostDetailScreen extends State<PostDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments as String;
    final thePost = Provider.of<Posts>(
        context,
        listen: false,
    ).findById(postId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(thePost.description, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
                thePost.imageUrl,
                fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon:
                  thePost.isLiked ?
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
                    thePost.toggleIsLiked();
                    Provider.of<Posts>(context, listen: false).likePost(thePost.id);
                    setState(() {});
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    thePost.postDate
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
