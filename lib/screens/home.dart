import 'package:docprompt_explorer_app/utils/colors.dart'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 80),
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
              'Visionary',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Just tell MYTH what you imagine — we'll take it from there.',
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
                color: AppColors.background,
                border: Border.all(color: AppColors.textSecondary),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Just type what you want to build',
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.poppins(color: AppColors.textPrimary),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'MYTH v1.0 - Core',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: AppColors.primary),
                      SizedBox(width: 16),
                      Icon(Icons.send, color: AppColors.primary),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                ...['Build a finance app', 'Design for an ecommerce store',
                    'Build a fitness app', 'Create a calculator'].map((text) =>
                    Container(
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
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}