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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Just type what you want to build',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            value: 'MYTH v1.0 - Core',
                            items: ['MYTH v1.0 - Core'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                            dropdownColor: AppColors.background,
                            underline: Container(),
                            iconEnabledColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'Build a finance app',
                      'Design for an ecommerce store',
                      'Build a fitness app',
                      'Create a calculator',
                    ].map((example) => OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: AppColors.primary)),
                        foregroundColor: MaterialStateProperty.all(AppColors.primary),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                      ),
                      child: Text(example, style: GoogleFonts.montserrat(fontSize: 12)),
                    )).toList(),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}