import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_arch_01/core/models/comment.dart';
import 'package:provider_arch_01/core/models/post.dart';
import 'package:provider_arch_01/core/models/user.dart';

class Api {
  static const endpoint = '';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    var res = await client.get('url');
    var parsed = json.decode(res.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    // Get comments for post
    var response = await client.get('$endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
