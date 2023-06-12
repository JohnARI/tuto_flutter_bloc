import '../../../../api/post/post_service.dart';
import '../models/post.dart';

///! Classe qui permet de faire le lien entre l'API et l'application
///! On y mettra toutes les méthodes liées à la feature qui permet de récupérer les données de l'API
class PostRepository {
  static Future<List<Post>> fetchPosts(int page) async {
    try {
      final List<Post> posts = await PostApiService.fetchPosts(page);
      return posts;
    } catch (e) {
      // On relance l'erreur pour que l'UI puisse l'afficher
      rethrow;
    }
  }

  static Future<bool> createPost(String title, String body) async {
    try {
      final bool createPost = await PostApiService.createPost(title, body);
      return createPost;
    } catch (e) {
      // On relance l'erreur pour que l'UI puisse l'afficher
      rethrow;
    }
  }
}
