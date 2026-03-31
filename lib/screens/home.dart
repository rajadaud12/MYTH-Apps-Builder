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
                'Just tell MYTH what you imagine — we\'ll take it from there.',
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
                    PopupMenuButton<String>(
                      initialValue: 'MYTH v1.0 - Core',
                      onSelected: (String value) {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'MYTH v1.0 - Core',
                            style: TextStyle(color: AppColors.accent),
                          ),
                          Icon(Icons.arrow_drop_down, color: AppColors.accent),
                        ],
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem<String>(
                          value: 'MYTH v1.0 - Core',
                          child: Text(
                            'MYTH v1.0 - Core',
                            style: TextStyle(color: AppColors.accent),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.accent),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  _buildExampleButton('Build a finance app'),
                  _buildExampleButton('Design for an ecommerce store'),
                  _buildExampleButton('Build a fitness app'),
                  _buildExampleButton('Create a calculator'),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleButton(String text) {
    return Material(
      color: AppColors.buttonBackground,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}