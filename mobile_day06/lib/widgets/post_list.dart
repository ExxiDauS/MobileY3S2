import 'package:flutter/material.dart';

import '../models/post.dart';
import '../screens/post_details.dart';

class PostList extends StatefulWidget {
  final List<Post> posts;
  const PostList({super.key, required this.posts});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.0),
      shrinkWrap: true,
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return ListTile(
          title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), overflow: TextOverflow.ellipsis,),
          subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: Icon(Icons.arrow_forward, size: 16,),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(id: post.id)));
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}