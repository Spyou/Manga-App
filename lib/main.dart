import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< Updated upstream
import 'package:manga_app/Widgets/bottom_navigation.dart';
import 'package:manga_app/blocs/home_bloc/home_bloc.dart';
import 'package:manga_app/graphql/client.dart';

import 'di/get_it.dart';
=======

import 'Widgets/bottom_navigation.dart';
>>>>>>> Stashed changes

void main() {
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(apiService: ApiService()),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                    useMaterial3: true,
                    fontFamily: GoogleFonts.poppins().fontFamily)
                .copyWith(
              scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
            ),
            title: 'Manga App',
            debugShowCheckedModeBanner: false,
            home: const BottomNavbar(),
          );
        },
        listener: (BuildContext context, HomeState state) {},
      ),
    );
  }
}
