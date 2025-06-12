import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/menu_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const MenuDrawer(),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.blue.shade200, width: 1),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: const <Widget>[
                            Icon(Icons.phone_android,
                                size: 100, color: Colors.blue),
                            Text(
                              'Belajar Flutter untuk Pemula',
                              style: TextStyle(
                                  fontSize: 24, fontFamily: "Serif", height: 1),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.green.shade200, width: 1),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Text("Kolom pertama"),
                            Text("Kolom kedua"),
                          ],
                        ),
                      ),
                    ),
                  ])),
        ));
  }
}
