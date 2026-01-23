import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';

class SummarySection extends StatelessWidget {
  final LanguageService languageService;

  const SummarySection({super.key, required this.languageService});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageService.isVietnamese ? 'Giới thiệu' : 'About Me',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            languageService.summary,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.textSecondary,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            languageService.careerGoal,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.7,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
