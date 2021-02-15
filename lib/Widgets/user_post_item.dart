import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/persons.dart';

class UserPostItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserPostItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 280,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
             IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<Persons>(context, listen: false).deletePost(id);
                    },
             )
          ],
        ),
      ],
    );
    /*
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),);*/
  }
}
