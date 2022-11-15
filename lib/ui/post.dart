import 'package:flutter/material.dart';
import 'package:post_data/model/post_model.dart';

import '../helper/http_helper.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);
  final HttpHelper httpHelper = HttpHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts App'),
        ),
        body: FutureBuilder(
          future: httpHelper.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data ?? <Post>[];
              return ListView(
                children: posts
                    .map(
                      (Post post) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          leading: Text("${post.id}"),
                          trailing: Icon(Icons.favorite_border),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
