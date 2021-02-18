import 'package:flutter/material.dart';
import '../Widgets/posts_grid.dart';
import '../Widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if(_isInit) {
      Provider.of<Posts>(context).getPostsFromServer();
    }
    _isInit = false;
    super.didChangeDependencies();
  }
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
