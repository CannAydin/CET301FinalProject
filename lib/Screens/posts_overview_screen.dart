import 'package:flutter/material.dart';
import '../Widgets/posts_grid.dart';
import '../Widgets/app_drawer.dart';

class PostsOverviewScreen extends StatelessWidget {
  static const routeName = '/PostScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          Text('Just Like It'),
      ),
      drawer: AppDrawer(),
      body: PostsGrid()
    );
  }
}


