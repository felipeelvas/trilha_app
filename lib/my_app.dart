import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilha_app/pages/home_page.dart';
import 'package:trilha_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.robotoTextTheme(),
        // appBarTheme: const AppBarTheme(
        //     backgroundColor: Colors.blue,
        //     titleTextStyle: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
          ),
      home: const LoginPage(),
    );
  }
}