import 'package:flutter/material.dart';
import '../Screens/user_page.dart';
import '../Screens/posts_overview_screen.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/PostScreen');
            },
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserPage.routeName);
            },
          )
        ],
      )
    );
  }
}
