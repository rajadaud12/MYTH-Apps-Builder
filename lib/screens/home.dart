import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prompt_assistant_app/utils/colors.dart'; 

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            RichText(
              text: TextSpan(
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Hello Again, ',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                  TextSpan(
                    text: 'Visionary',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Just tell MYTH what you imagine — we’ll take it from there.',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: AppColors.secondary.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Container(
              width: 600,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            style: TextStyle(color: AppColors.secondary),
                            decoration: InputDecoration(
                              hintText: 'Just type what you want to build',
                              hintStyle: TextStyle(
                                color: AppColors.secondary.withOpacity(0.5),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        DropdownButton<String>(
                          value: 'v1.0',
                          onChanged: (value) {},
                          items: <String>['v1.0', 'v2.0'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                'MYTH $value - Core',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            );
                          }).toList(),
                          style: TextStyle(color: AppColors.primary),
                          underline: Container(),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.send, color: Colors.black, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildExampleButton('Build a finance app'),
                      _buildExampleButton('Design for an ecommerce store'),
                      _buildExampleButton('Build a fitness app'),
                      _buildExampleButton('Create a calculator'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.secondary.withOpacity(0.7),
          fontSize: 14,
        ),
      ),
    );
  }
}