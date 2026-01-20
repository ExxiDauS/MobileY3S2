import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/post_services.dart';

class PostDetails extends StatefulWidget {
  final int id;
  const PostDetails({super.key, required this.id});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPostById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details Id ${widget.id}'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final post = snapshot.data!;
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      post.body,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return const Text('Post not found');
            }
          },
        ),
      ),
    );
  }
}