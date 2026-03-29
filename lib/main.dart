import 'package:flutter/material.dart';
import 'package:prompt_documentation_app/utils/colors.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:prompt_documentation_app/screens/home.dart'; 

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 44.0, bottom: 34.0)), child: child!), 
      title: 'Prompt Documentation App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}