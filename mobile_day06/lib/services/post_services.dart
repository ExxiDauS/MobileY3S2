import "dart:async";
import "dart:convert";

import "package:http/http.dart" as http;
import '../models/post.dart';

final String baseUrl = "https://jsonplaceholder.typicode.com";

Future<List<Post>> fetchAllPost() async {
  final response = await http.get(Uri.parse("$baseUrl/posts"));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    // log("Fetched ${jsonList.length} posts");
    return jsonList.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load posts");
  }
}

Future<Post> fetchPostById(int id) async {
  final response = await http.get(Uri.parse("$baseUrl/posts/$id"));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load post with id $id");
  }
}
