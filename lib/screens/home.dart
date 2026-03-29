import 'package:flutter/material.dart';
import 'package:prompt_documentation_app/utils/colors.dart'; 
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Hello Again, Visionary',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Just tell MYTH what you imagine — we\'ll take it from there.',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Just type what you want to build',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: DropdownButton<String>(
                      value: 'MYTH v1.0 - Core',
                      items: ['MYTH v1.0 - Core'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: AppColors.primary)),
                        );
                      }).toList(),
                      onChanged: (_) {},
                      dropdownColor: AppColors.background,
                      underline: Container(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIconConstraints: BoxConstraints(minWidth: 150),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var example in ['Build a finance app', 'Design for an ecommerce store', 'Build a fitness app', 'Create a calculator'])
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(color: AppColors.primary)),
                          foregroundColor: MaterialStateProperty.all(AppColors.primary),
                        ),
                        child: Text(example),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}