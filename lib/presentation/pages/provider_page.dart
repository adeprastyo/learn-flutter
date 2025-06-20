import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/menu_drawer.dart';
import 'package:provider/provider.dart';
import '../../core/network/user_service.dart';
import '../../providers/user.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  bool _loading = false;

  Future<void> loadUserProfile() async {
    final profile = await UserService.fetchUserProfile();

    if (!mounted) return;

    setState(() => _loading = true);

    if (profile != null) {
      context.read<UserProvider>().setUser(profile);
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Page')),
      drawer: const MenuDrawer(),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : user == null
                ? ElevatedButton(
                    onPressed: loadUserProfile,
                    child: const Text("Load User Profile"),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                          radius: 40),
                      const SizedBox(height: 10),
                      Text(user.name),
                      Text(user.email),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<UserProvider>().clearUser();
                        },
                        child: const Text("Clear Profile"),
                      )
                    ],
                  ),
      ),
    );
  }
}
