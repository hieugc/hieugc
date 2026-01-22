import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/colors.dart';
import '../../config/sizes.dart';
import '../../services/language_service.dart';

class Sidebar extends StatelessWidget {
  final LanguageService languageService;

  const Sidebar({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final sidebarWidth = AppSizes.sidebarWidth(context);
    final padding = AppSizes.sidebarPadding(context);
    final avatarSize = AppSizes.avatarSize(context);

    return Container(
      width: sidebarWidth,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.cardBg,
        border: Border(
          right: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: padding * 1.5, horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.accent, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.3),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  languageService.avatarPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.accent.withValues(alpha: 0.2),
                    child: Icon(
                      Icons.person,
                      size: avatarSize * 0.5,
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.itemSpacing(context)),

            // Name
            Text(
              languageService.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSizes.heading4(context),
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSizes.itemSpacingSmall(context)),

            // Title
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.cardPaddingSmall(context),
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                languageService.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSizes.label(context),
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: AppSizes.itemSpacing(context)),

            // Social Links
            Wrap(
              alignment: WrapAlignment.center,
              spacing: AppSizes.itemSpacingSmall(context),
              runSpacing: AppSizes.itemSpacingSmall(context),
              children: [
                _SocialButton(
                  icon: FontAwesomeIcons.github,
                  url: languageService.github,
                ),
                _SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: languageService.linkedin,
                ),
                _SocialButton(
                  icon: FontAwesomeIcons.facebook,
                  url: languageService.facebook,
                ),
                _SocialButton(
                  icon: FontAwesomeIcons.envelope,
                  url: 'mailto:${languageService.email}',
                ),
              ],
            ),
            SizedBox(height: AppSizes.cardPadding(context)),

            // Divider
            _buildDivider(),
            SizedBox(height: AppSizes.itemSpacing(context)),

            // Contact Info Section
            _buildSectionTitle(context, languageService.isVietnamese ? 'Thông tin liên hệ' : 'Contact Info'),
            SizedBox(height: AppSizes.itemSpacingSmall(context)),
            _InfoItem(icon: Icons.email_outlined, text: languageService.email),
            SizedBox(height: AppSizes.itemSpacingSmall(context)),
            _InfoItem(icon: Icons.phone_outlined, text: languageService.phone),
            SizedBox(height: AppSizes.itemSpacingSmall(context)),
            _InfoItem(icon: Icons.cake_outlined, text: languageService.birthday),
            SizedBox(height: AppSizes.cardPadding(context)),

            // Divider
            _buildDivider(),
            SizedBox(height: AppSizes.itemSpacing(context)),

            // Skills Section
            _buildSectionTitle(context, languageService.skillsTitle),
            SizedBox(height: AppSizes.itemSpacing(context)),
            _buildSkillsSection(context, languageService),
            SizedBox(height: AppSizes.cardPadding(context)),

            // Download Resume Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _downloadResume(languageService.resumePath),
                icon: Icon(Icons.download, size: AppSizes.iconSmall(context)),
                label: Text(
                  languageService.downloadResumeButton,
                  style: TextStyle(fontSize: AppSizes.bodySmall(context)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.cardPaddingSmall(context)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium(context)),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.cardPadding(context)),

            // Copyright
            Text(
              '© ${DateTime.now().year} ${languageService.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSizes.caption(context),
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppColors.divider,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.bodySmall(context),
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, LanguageService langService) {
    final skills = langService.skills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.entries.map((entry) {
        final categoryData = entry.value as Map<String, dynamic>;
        final title = categoryData['title'] as String? ?? '';
        final items = (categoryData['items'] as List<dynamic>?)?.cast<String>() ?? [];

        return _SkillCategory(title: title, items: items);
      }).toList(),
    );
  }

  Future<void> _downloadResume(String resumePath) async {
    final uri = Uri.parse(resumePath);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> items;

  const _SkillCategory({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.itemSpacing(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: AppSizes.itemSpacingSmall(context)),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSizes.label(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.itemSpacingSmall(context)),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: items.map((item) => _SkillTag(text: item)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillTag extends StatelessWidget {
  final String text;

  const _SkillTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.itemSpacingSmall(context),
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBg,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall(context)),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: AppSizes.caption(context),
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialButton({
    required this.icon,
    required this.url,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final buttonSize = AppSizes.socialButtonSize(context);
    final iconSize = AppSizes.socialIconSize(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: buttonSize,
          height: buttonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent : AppColors.primaryBg,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium(context)),
            border: Border.all(
              color: _isHovered ? AppColors.accent : AppColors.border,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: iconSize,
            color: _isHovered ? Colors.black : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSizes.iconSmall(context),
          color: AppColors.accent,
        ),
        SizedBox(width: AppSizes.itemSpacingSmall(context)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSizes.label(context),
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
