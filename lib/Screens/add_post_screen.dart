import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../providers/posts.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/add-post';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _imageUrlController = TextEditingController();
  final _post = GlobalKey<FormState>();
  var _addedPost = Post(
    id: null,
    username: '',
    description: '',
    postDate: null,
    imageUrl: '',
  );

  @override
  void dispose() {
    _imageUrlController.dispose();
    super.dispose();
  }

  void _save() {
    _post.currentState.save();
    /*print(_addedPost.description);
    print(_addedPost.imageUrl);*/
    Provider.of<Posts>(context, listen: false).addPost(_addedPost);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Yeni Post', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.done,
              ),
              onPressed: _save,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _post,
          child: ListView(
            children: <Widget> [
              TextFormField(
                decoration: InputDecoration(labelText: 'Kullanıcı Adını Giriniz'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _addedPost = Post(
                      id: null,
                      description: _addedPost.description,
                      username: value,
                      postDate: _addedPost.postDate,
                      imageUrl: _addedPost.imageUrl
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Açıklama Giriniz'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _addedPost = Post(
                    id: null,
                    description: value,
                    username: _addedPost.username,
                    postDate: _addedPost.postDate,
                    imageUrl: _addedPost.imageUrl
                  );
                },
              ),
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'URL Giriniz'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {

                        });
                      },
                      onSaved: (value) {
                        _addedPost = Post(
                            id: null,
                            description: _addedPost.description,
                            username: _addedPost.username,
                            postDate: _addedPost.postDate,
                            imageUrl: value
                        );
                      },
                ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1
                    )
                  ),
                  child: _imageUrlController.text.isEmpty
                  ? Text(
                    'URL giriniz',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12)
                  )
                  : FittedBox(
                      child: Image.network(
                        _imageUrlController.text,
                        fit: BoxFit.cover,
                      ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
