import 'package:flutter/material.dart';
import '../Widgets/app_drawer.dart';

class UserPostItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserPostItem(this.title, this.imageUrl);
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
                    icon: Icon(Icons.delete)
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
