import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';
import '../Widgets/user_post_item.dart';
import '../Widgets/app_drawer.dart';
import '../Screens/add_post_screen.dart';
class UserPage extends StatelessWidget {
  static const routeName = '/UserPage';
  @override
  Widget build(BuildContext context) {
    final personData = Provider.of<Posts>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add), onPressed: (){
            Navigator.of(context).pushNamed(AddPostScreen.routeName);
            //...
          },),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
          itemCount: personData.items.length,
          itemBuilder: (_, i) => Column(
            children:[
            UserPostItem(
              personData.items[i].id,
              personData.items[i].description,
              personData.items[i].imageUrl,
            ),
              Divider(thickness: 2,)
            ]
          ),
        ),
      ),
    );
  }
}
