import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../services/language_service.dart';
import '../common/custom_button.dart';
import '../common/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final LanguageService languageService;

  const FooterSection({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.cardBg,
      padding: Responsive.sectionPadding(context),
      child: Container(
        constraints: Responsive.contentConstraints(),
        padding: Responsive.pagePadding(context),
        child: Column(
          children: [
            Text(
              languageService.contactTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                SocialIconButton(
                  icon: FontAwesomeIcons.github,
                  url: languageService.github,
                  color: AppColors.github,
                ),
                SocialIconButton(
                  icon: FontAwesomeIcons.envelope,
                  url: languageService.socialLinks['email']!,
                  color: AppColors.email,
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: languageService.downloadResumeButton,
              onPressed: () => _downloadResume(languageService.resumePath),
              icon: Icons.download,
            ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.divider, width: 1),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    languageService.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    languageService.email,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '© ${DateTime.now().year} ${languageService.name}. All rights reserved.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadResume(String resumePath) async {
    final uri = Uri.parse(resumePath);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
