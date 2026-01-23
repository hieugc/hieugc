import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../services/language_service.dart';
import '../common/custom_button.dart';
import '../common/social_icon_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkPressed;
  final LanguageService languageService;

  const HeroSection({
    super.key,
    required this.onViewWorkPressed,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      constraints: Responsive.contentConstraints(),
      padding: Responsive.pagePadding(context),
      child: isMobile || isTablet
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context, size: 200),
        const SizedBox(height: 40),
        _buildHeroContent(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _buildHeroContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              _buildProfileImage(context, size: 350),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, {required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          languageService.avatarPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.cardBg,
              child: const Icon(
                Icons.person,
                size: 100,
                color: AppColors.textSecondary,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          languageService.isVietnamese ? 'Tôi là' : "I'm",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          languageService.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 36 : 56,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          languageService.title,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.w600,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: isMobile ? double.infinity : 600,
          child: AnimatedTextKit(
            key: ValueKey(languageService.currentLanguage),
            animatedTexts: [
              TypewriterAnimatedText(
                languageService.summary,
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                speed: const Duration(milliseconds: 30),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        const SizedBox(height: 40),
        _buildSocialLinks(context),
        const SizedBox(height: 32),
        CustomButton(
          text: languageService.viewWorkButton,
          onPressed: onViewWorkPressed,
          icon: Icons.arrow_forward,
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Wrap(
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      spacing: 16,
      children: [
        SocialIconButton(
          icon: FontAwesomeIcons.github,
          url: languageService.github,
          color: AppColors.github,
        ),
        SocialIconButton(
          icon: FontAwesomeIcons.linkedin,
          url: languageService.linkedin,
          color: AppColors.linkedin,
        ),
        SocialIconButton(
          icon: FontAwesomeIcons.facebook,
          url: languageService.facebook,
          color: AppColors.facebook,
        ),
        SocialIconButton(
          icon: FontAwesomeIcons.envelope,
          url: 'mailto:${languageService.email}',
          color: AppColors.email,
        ),
      ],
    );
  }
}
