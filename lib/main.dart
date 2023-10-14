import 'package:flutter/material.dart';
import 'package:sliding_navbar/Widgets/slider_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true)
          .copyWith(scaffoldBackgroundColor: Colors.black),
      title: 'Manga App',
      debugShowCheckedModeBanner: false,
      home: const BottomNavbar(),
    );
  }
}
