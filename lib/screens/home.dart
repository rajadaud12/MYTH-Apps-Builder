import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prompt_processor_ai_app/utils/colors.dart'; 

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              ...[
                Text.rich(
                  TextSpan(
                    text: 'Hello Again, ',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Visionary',
                        style: TextStyle(color: AppColors.accent),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Just tell MYTH what you imagine — we’ll take it from there.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: AppColors.textPrimary),
                          decoration: InputDecoration(
                            hintText: 'Just type what you want to build',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: 'MYTH v1.0 - Core',
                        items: ['MYTH v1.0 - Core'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: AppColors.accent),
                            ),
                          );
                        }).toList(),
                        onChanged: (_) {},
                        underline: Container(),
                        style: TextStyle(color: AppColors.accent),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: AppColors.accent),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...[
                      _buildExampleButton('Build a finance app'),
                      _buildExampleButton('Design for an ecommerce store'),
                      _buildExampleButton('Build a fitness app'),
                      _buildExampleButton('Create a calculator'),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}