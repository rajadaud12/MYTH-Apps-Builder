import 'package:flutter/material.dart';
import 'package:prompt_assistant_app/screens/home.dart'; 
import 'package:prompt_assistant_app/utils/colors.dart'; 

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 44.0, bottom: 34.0)), child: child!), 
      title: 'Prompt Assistant',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.secondary),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}