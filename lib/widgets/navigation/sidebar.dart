import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';
import '../common/language_toggle.dart';

class Sidebar extends StatelessWidget {
  final LanguageService languageService;

  const Sidebar({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = (screenWidth * 0.30).clamp(280.0, 380.0);

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
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Language Toggle
            Align(
              alignment: Alignment.topRight,
              child: LanguageToggle(languageService: languageService),
            ),
            const SizedBox(height: 16),

            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.accent, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.3),
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
                    color: AppColors.accent.withOpacity(0.2),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Name
            Text(
              languageService.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                languageService.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Social Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: FontAwesomeIcons.github,
                  url: languageService.github,
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: FontAwesomeIcons.envelope,
                  url: 'mailto:${languageService.email}',
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Divider
            _buildDivider(),
            const SizedBox(height: 20),

            // Contact Info Section
            _buildSectionTitle(languageService.isVietnamese ? 'Thông tin liên hệ' : 'Contact Info'),
            const SizedBox(height: 12),
            _InfoItem(icon: Icons.email_outlined, text: languageService.email),
            const SizedBox(height: 8),
            _InfoItem(icon: Icons.phone_outlined, text: languageService.phone),
            const SizedBox(height: 8),
            _InfoItem(icon: Icons.cake_outlined, text: languageService.birthday),
            const SizedBox(height: 24),

            // Divider
            _buildDivider(),
            const SizedBox(height: 20),

            // Skills Section
            _buildSectionTitle(languageService.skillsTitle),
            const SizedBox(height: 16),
            _buildSkillsSection(languageService),
            const SizedBox(height: 24),

            // Download Resume Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _downloadResume(languageService.resumePath),
                icon: const Icon(Icons.download, size: 18),
                label: Text(languageService.downloadResumeButton),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Copyright
            Text(
              '© ${DateTime.now().year} ${languageService.name}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
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

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSkillsSection(LanguageService langService) {
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
      padding: const EdgeInsets.only(bottom: 16),
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
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryBg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent : AppColors.primaryBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.accent : AppColors.border,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 18,
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
          size: 16,
          color: AppColors.accent,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
