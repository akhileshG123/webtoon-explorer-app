import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webtoon Explorer',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

