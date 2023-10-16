import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_navbar/Widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
              useMaterial3: true, fontFamily: GoogleFonts.poppins().fontFamily)
          .copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
      ),
      title: 'Manga App',
      debugShowCheckedModeBanner: false,
      home: const BottomNavbar(),
    );
  }
}
