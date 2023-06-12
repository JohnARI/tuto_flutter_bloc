import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../features/post/data/models/post.dart';
import '../api_service.dart';
import '../api_endpoints.dart';

///! Classe permettant de faire les appels à l'API
class PostApiService {
  static const int postsPerPage = 10;

  // La méthode permettant de récupérer les posts
  static Future<List<Post>> fetchPosts(int page) async {
    try {
      final http.Response response = await ApiService.client.get(
        Uri.parse('${ApiEndPoints.posts}?_limit=$postsPerPage&_page=$page'),
      );

      final List<dynamic> result = jsonDecode(response.body);

      // Convertis chaque item de la liste en Post grâce à la méthode fromMap qui se trouve dans le modèle
      return result.map<Post>((dynamic item) => Post.fromMap(item)).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }

  static Future<bool> createPost(String title, String body) async {
    try {
      final http.Response response = await ApiService.client.post(
        Uri.parse(ApiEndPoints.posts),
        body: <String, String>{
          'title': title,
          'body': body,
          'userId': '42',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
