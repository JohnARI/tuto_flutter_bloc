import 'api_service.dart';

///! On mettra les routes de l'API ici pour pouvoir les utiliser dans les services et les repositories.
///! On utilise une classe statique pour pouvoir y accéder sans instancier la classe
class ApiEndPoints {
  static final String posts = '${ApiService.baseUrl}/posts';
}
