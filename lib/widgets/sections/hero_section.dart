import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../data/portfolio_data.dart';
import '../common/custom_button.dart';
import '../common/social_icon_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkPressed;

  const HeroSection({
    super.key,
    required this.onViewWorkPressed,
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
        const SizedBox(height: 40),
        _buildCompanyLogos(context),
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
              const SizedBox(height: 40),
              _buildCompanyLogos(context),
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
            color: AppColors.accent.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          PortfolioData.avatarPath,
          fit: BoxFit.cover,
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
          "I'm",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          PortfolioData.name,
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
          PortfolioData.title,
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
            animatedTexts: [
              TypewriterAnimatedText(
                PortfolioData.tagline,
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                speed: const Duration(milliseconds: 50),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        const SizedBox(height: 40),
        _buildSocialLinks(context),
        const SizedBox(height: 32),
        CustomButton(
          text: PortfolioData.ctaButtonText,
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
          url: PortfolioData.github,
          color: AppColors.github,
        ),
        SocialIconButton(
          icon: FontAwesomeIcons.envelope,
          url: PortfolioData.socialLinks['email']!,
          color: AppColors.email,
        ),
      ],
    );
  }

  Widget _buildCompanyLogos(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        _buildCompanyLogo('Meta'),
        _buildCompanyLogo('Google'),
        _buildCompanyLogo('LinkedIn'),
        _buildCompanyLogo('Slack'),
      ],
    );
  }

  Widget _buildCompanyLogo(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
