import 'package:flutter/material.dart';
import 'package:permisos_app/providers/theme_provider.dart';
import 'package:permisos_app/share_preferences/preferences.dart';
import 'package:permisos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Setting';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('Dark Mode'),
                onChanged: (value) {
                  setState(() {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    if (value) {
                      themeProvider.setDarkMode();
                    } else {
                      themeProvider.setLightMode();
                    }
                  });
                }),
            const Divider(),
            RadioListTile(
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 1;
                  });
                },
                title: const Text('Masculino')),
            RadioListTile(
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 1;
                  });
                },
                title: const Text('Femenino')),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                initialValue: Preferences.name,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                onChanged: (value) {
                  Preferences.name = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
