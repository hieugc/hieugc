import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';
import '../common/language_toggle.dart';

class Sidebar extends StatelessWidget {
  final LanguageService languageService;
  final Function(int) onMenuTap;

  const Sidebar({
    super.key,
    required this.languageService,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        border: Border(
          right: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          children: [
            // Language Toggle
            Align(
              alignment: Alignment.topRight,
              child: LanguageToggle(languageService: languageService),
            ),
            const SizedBox(height: 20),

            // Avatar
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.accent, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.3),
                    blurRadius: 20,
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
                      size: 80,
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name
            Text(
              languageService.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                languageService.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Social Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: FontAwesomeIcons.github,
                  url: languageService.github,
                ),
                const SizedBox(width: 16),
                _SocialButton(
                  icon: FontAwesomeIcons.envelope,
                  url: 'mailto:${languageService.email}',
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Divider
            Container(
              height: 1,
              color: AppColors.divider,
            ),
            const SizedBox(height: 24),

            // Contact Info
            _InfoItem(
              icon: Icons.email_outlined,
              text: languageService.email,
            ),
            const SizedBox(height: 12),
            _InfoItem(
              icon: Icons.phone_outlined,
              text: languageService.phone,
            ),
            const SizedBox(height: 12),
            _InfoItem(
              icon: Icons.cake_outlined,
              text: languageService.birthday,
            ),
            const SizedBox(height: 32),

            // Divider
            Container(
              height: 1,
              color: AppColors.divider,
            ),
            const SizedBox(height: 24),

            // Navigation Menu
            _NavMenuItem(
              icon: Icons.home_outlined,
              text: languageService.navHome,
              onTap: () => onMenuTap(0),
            ),
            _NavMenuItem(
              icon: Icons.folder_outlined,
              text: languageService.navPortfolio,
              onTap: () => onMenuTap(1),
            ),
            _NavMenuItem(
              icon: Icons.work_outline,
              text: languageService.navExperience,
              onTap: () => onMenuTap(2),
            ),
            _NavMenuItem(
              icon: Icons.build_outlined,
              text: languageService.skillsTitle,
              onTap: () => onMenuTap(3),
            ),
            _NavMenuItem(
              icon: Icons.mail_outline,
              text: languageService.navContact,
              onTap: () => onMenuTap(4),
            ),
            const SizedBox(height: 32),

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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Copyright
            Text(
              '© ${DateTime.now().year}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent : AppColors.primaryBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.accent : AppColors.border,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 20,
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
          size: 18,
          color: AppColors.accent,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _NavMenuItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _NavMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavMenuItem> createState() => _NavMenuItemState();
}

class _NavMenuItemState extends State<_NavMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: _isHovered ? AppColors.accent : AppColors.textSecondary,
              ),
              const SizedBox(width: 12),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  color: _isHovered ? AppColors.accent : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
