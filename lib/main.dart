import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';
import 'package:flutter_application_1/presentation/pages/login.dart';
import 'package:flutter_application_1/presentation/pages/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const LoginPage(title: 'Login Page'),
      // initialRoute: "/",
      initialRoute: "/login",
      routes: {
        "/": (context) => const MyHomePage(title: "Home"),
        "/login": (context) => const LoginPage(title: "Woi Login Page"),
        // "/halaman1": (context) => Scaffold(
        //       appBar: AppBar(title: const Text("Halaman 1")),
        //       drawer: const MenuDrawer(),
        //       body: const Center(child: Text("Ini halaman 1")),
        //     ),
        "/movies": (context) => const MoviePage(),
      },
    );
  }
}
