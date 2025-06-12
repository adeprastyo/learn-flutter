import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.title = "Login Page"});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _error = "";

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == "admin" && password == "admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Welcome!")),
      );
    } else {
      setState(() {
        _error = "Invalid email or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.person,
                      size: 100,
                    ),
                    Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Login"),
                  )),
              Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ));
  }
}
