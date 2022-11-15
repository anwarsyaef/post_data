import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:post_data/ui/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      debugShowCheckedModeBanner: false,
      home: PostsPage(),
    );
  }
}
