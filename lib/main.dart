import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  //! Initialise le fichier .env
  await dotenv.load();
  runApp(const MyApp());
}