import 'package:flutter/material.dart';
import '../Screens/user_page.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          ListTile(
            leading: Icon(Icons.home, color: Colors.orange),
            title: Text('Anasayfa'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(Icons.person, color: Colors.orange,),
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
