import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';

class ContentNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int) onMenuTap;
  final LanguageService languageService;

  const ContentNavBar({
    super.key,
    required this.scrollController,
    required this.onMenuTap,
    required this.languageService,
  });

  @override
  State<ContentNavBar> createState() => _ContentNavBarState();
}

class _ContentNavBarState extends State<ContentNavBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.languageService;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppColors.cardBg.withOpacity(0.95)
            : AppColors.primaryBg,
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _NavItem(
              text: lang.isVietnamese ? 'Giới thiệu' : 'About Me',
              onTap: () => widget.onMenuTap(0),
            ),
            _NavItem(
              text: lang.projectsTitle,
              onTap: () => widget.onMenuTap(1),
            ),
            _NavItem(
              text: lang.experienceTitle,
              onTap: () => widget.onMenuTap(2),
            ),
            _NavItem(
              text: lang.educationTitle,
              onTap: () => widget.onMenuTap(3),
            ),
            _NavItem(
              text: lang.servicesTitle,
              onTap: () => widget.onMenuTap(4),
            ),
            _NavItem(
              text: lang.navContact,
              onTap: () => widget.onMenuTap(5),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.accent : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              color: _isHovered ? AppColors.accent : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
