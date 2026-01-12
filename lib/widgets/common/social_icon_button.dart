import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/colors.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color? color;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    this.color,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.color ?? AppColors.accent).withOpacity(0.1)
                : Colors.transparent,
            border: Border.all(
              color: _isHovered
                  ? (widget.color ?? AppColors.accent)
                  : AppColors.border,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            widget.icon,
            size: 24,
            color: _isHovered
                ? (widget.color ?? AppColors.accent)
                : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
