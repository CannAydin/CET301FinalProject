import 'package:cet301finalproject/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cet301finalproject/Screens/posts_overview_screen.dart';
import './Screens/person_detail_screen.dart';
import './Screens/user_page.dart';
import './Screens/add_post_screen.dart';
import './providers/persons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Persons(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange
        ),
        home: PostsOverviewScreen(),
        routes: {
          PersonDetailScreen.routeName: (ctx) => PersonDetailScreen(),
          UserPage.routeName: (ctx) => UserPage(),
          PostsOverviewScreen.routeName: (ctx) => PostsOverviewScreen(),
          AddPostScreen.routeName: (ctx) => AddPostScreen()
        },
      ),
    );
  }
}

