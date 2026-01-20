import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/post_services.dart';
import '../widgets/post_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = fetchAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Post>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PostList(posts: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}