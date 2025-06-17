import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/menu_drawer.dart';

class LocalState extends StatefulWidget {
  const LocalState({super.key});

  @override
  State<LocalState> createState() => _LocalStateState();
}

class _LocalStateState extends State<LocalState> {
  int _counter = 0;
  String _color = "Grey";

  final Map<String, MaterialColor> colorMap = {
    "grey": Colors.grey,
    "blue": Colors.blue,
    "red": Colors.red,
    "green": Colors.green,
  };

  void _tambah() {
    setState(() {
      _counter++;
    });
  }

  void _gantiWarna(String warna) {
    setState(() {
      _color = warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local State"),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      "$_counter"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: _tambah, child: const Text("Tambah")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: colorMap[_color]?.shade200 ?? Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color:
                            colorMap[_color]?.shade600 ?? Colors.grey.shade600,
                      ),
                      _color.toUpperCase()),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () => _gantiWarna("blue"),
                          child: const Text("Biru")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                          onPressed: () => _gantiWarna("grey"),
                          child: const Text("Abu-abu")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () => _gantiWarna("red"),
                          child: const Text("Merah")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () => _gantiWarna("green"),
                          child: const Text("Hijau")),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
