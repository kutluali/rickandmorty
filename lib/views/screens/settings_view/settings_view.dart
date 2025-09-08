import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/theme.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>(); 
    final isDark = appTheme.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: const AppBarWidget(title: 'Ayarlar', hideSettings: true),
      body: ListView(
        children: [
          ListTile(
            title: Text(isDark ? 'Aydınlık Tema Yap' : 'Karanlık Tema Yap'),
            trailing: Switch(
              value: isDark,
              onChanged: (_) => context.read<AppTheme>().toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
