import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Screens/post_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';

class PersonDetailScreen extends StatelessWidget {

  static const routeName = '/person-detail';

  @override
  Widget build(BuildContext context) {
    final postUsername = ModalRoute.of(context).settings.arguments;
    final theUsersPosts = Provider.of<Posts>(
      context,
      listen: false,
    ).findByUsername(postUsername);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(postUsername, style: TextStyle(),),
      ),
      body: GridView.builder(
            itemCount: theUsersPosts.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: theUsersPosts[i],
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(),
                        settings: RouteSettings(
                        arguments: theUsersPosts[i].id
                        )
                      )
                  );
                },
                padding: EdgeInsets.all(0.0),
                child: Image.network(
                  theUsersPosts[i].imageUrl,
                  height: (MediaQuery.of(context).size.width/3),
                  fit: BoxFit.cover,
                  width: (MediaQuery.of(context).size.width/3),

                ),
              ),
            ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          ),
    );

  }
}
