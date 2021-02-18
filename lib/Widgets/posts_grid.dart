import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import './post_item.dart';

class PostsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final personsData = Provider.of<Posts>(context);
    final posts = personsData.items;
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
      itemCount: posts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          //create: (c) => posts[i], Burası disposed diye bir hataya sebep oluyor.
          // o yüzden CahngeNotifier'ın sonuna value ekledim
          // aşağıda da indexi value'ya verdim. (Kaynak internet)
          value: posts[i],
          child: PostItem(
          ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        mainAxisSpacing: 40,
      ),
    );
  }
}