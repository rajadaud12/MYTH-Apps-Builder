import 'package:flutter/material.dart';
import 'package:prompt_processor_ai_app/screens/home.dart'; 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 44.0, bottom: 34.0)), child: child!), 
      title: 'Prompt Processor AI',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}