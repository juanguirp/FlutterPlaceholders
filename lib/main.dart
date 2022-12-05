import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:placeholders/pages/pages.dart';
import 'package:placeholders/provider/photos_provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PhotosProvider(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio final',
      initialRoute: 'home',
      routes: {
        'home': (context) => const PhotoHomePage(),
        'detail': (context) => const PhotoDetailPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
