import 'package:flutter/material.dart';
import 'package:permisos_app/share_preferences/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const CustomDrawer(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('isDarkMode: ${Preferences.isDarkMode.toString()}'),
          const Divider(color: Colors.black),
          Text('Género: ${Preferences.gender == 1 ? 'Masculino' : 'Femenino'}'),
          const Divider(color: Colors.black),
          Text('Nombre: ${Preferences.name}'),
        ]));
  }
}
