import 'package:flutter/material.dart';
import 'package:flutter_basic_login_app/utils/colors.dart'; 
import 'package:flutter_basic_login_app/screens/login_screen.dart'; 
import 'package:flutter_basic_login_app/screens/home_screen.dart'; 
import 'package:flutter_basic_login_app/screens/todo_screen.dart'; 
import 'package:flutter_basic_login_app/screens/add_todo_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 44.0, bottom: 34.0)), child: child!), 
      title: 'Basic Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/todo': (context) => TodoScreen(),
        '/add-todo': (context) => AddTodoScreen(),
      },
    );
  }
}