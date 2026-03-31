import 'package:docprompt_explorer_app/utils/colors.dart'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Hello Again, ',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Shahab Hassan',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Just tell MYTH what you imagine — we\'ll take it from there.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(color: AppColors.textSecondary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Just type what you want to build',
                          hintStyle: GoogleFonts.poppins(
                            color: AppColors.textSecondary,
                          ),
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.poppins(color: AppColors.textPrimary),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Row(
                        children: [
                          Text(
                            'MYTH v1.0 - Core',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: AppColors.primary),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                        }
                      },
                      child: Icon(Icons.send, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      'Build a finance app',
                      'Design for an ecommerce store',
                      'Build a fitness app',
                      'Create a calculator',
                    ].map((text) => GestureDetector(
                      onTap: () {
                        _controller.text = text;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.textSecondary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          text,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}