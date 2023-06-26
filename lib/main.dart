import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_finder/features/movie_flow/movie_flow.dart';
import 'package:movie_finder/theme/custom_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Finder',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
