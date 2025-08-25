import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersViewModel()),
        // başka ViewModel varsa onları da buraya ekle
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
