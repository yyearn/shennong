import 'package:flutter/material.dart';
import '../models/post.dart';

class PostShow extends StatelessWidget{

  final Post post;

  PostShow({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${post.title}"),
        elevation: 0.0,
      ),
    );
  }
}