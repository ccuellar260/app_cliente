import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero, //const EdgeInsets.only(bottom: 5),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/header.jpg'),
                        fit: BoxFit.cover)),
              )),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // AuthController().logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          ListTile(
            title: const Text('Version Information'),
            leading: const Icon(Icons.info_outlined),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'CreditDocuManager',
                applicationVersion: 'Version: 1.0',
              );
            },
          ),
        ],
      ),
    );
  }
}
