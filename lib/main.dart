import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/edit_profile.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';
import 'package:flutter_application_1/presentation/pages/local_state_page.dart';
import 'package:flutter_application_1/presentation/pages/login.dart';
import 'package:flutter_application_1/presentation/pages/movie_page.dart';
import 'package:flutter_application_1/presentation/pages/provider_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'providers/user.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // initialRoute: "/login",
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(title: "Home"),
          "/login": (context) => const LoginPage(),
          "/movies": (context) => const MoviePage(),
          "/local-state": (context) => const LocalState(),
          "/edit-profile": (context) => const EditProfile(),
          "/provider-fake-api": (context) => const ProviderPage(),
        });
  }
}
