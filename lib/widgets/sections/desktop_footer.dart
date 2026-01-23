import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';

class DesktopFooter extends StatelessWidget {
  final LanguageService languageService;

  const DesktopFooter({super.key, required this.languageService});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.cardBg.withValues(alpha: 0.5),
      ),
      child: Column(
        children: [
          Text(
            languageService.contactTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            languageService.email,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
