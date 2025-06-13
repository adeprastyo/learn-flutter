import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';
import 'package:flutter_application_1/presentation/pages/login.dart';
import 'package:flutter_application_1/presentation/pages/movie_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/login",
      routes: {
        "/": (context) => const MyHomePage(title: "Home"),
        "/login": (context) => const LoginPage(title: "Woi Login Page"),
        "/movies": (context) => const MoviePage(),
      },
    );
  }
}
