import 'package:flutter/material.dart';
import 'package:flutter_multi_select_feature/Home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi Select Feature",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.teal),
      ),
      home: MultiSelectFeature(),
    );
  }
}
