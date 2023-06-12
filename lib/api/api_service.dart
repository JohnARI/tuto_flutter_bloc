import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

///! Classe permettant de faire les appels à l'API
class ApiService {
  static final http.Client _client = http.Client();
  static String _baseUrl = dotenv.env['API_BASE_URL']!;

  // Constructeur privé pour empêcher l'instanciation de la classe en dehors de la classe
  ApiService._();

  static ApiService init(String baseUrl) {
    _baseUrl = baseUrl;
    return ApiService._();
  }

  static http.Client get client => _client;

  static String get baseUrl => _baseUrl;

  static void dispose() {
    _client.close();
  }
}
