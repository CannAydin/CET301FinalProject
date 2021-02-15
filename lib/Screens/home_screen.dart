import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (ctc, index) => Container(
          padding: EdgeInsets.all(8),
          child: (Text('This is work')
          ),
        ),
      ),
    );

  }
}