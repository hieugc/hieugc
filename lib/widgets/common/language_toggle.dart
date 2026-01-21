import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';

class LanguageToggle extends StatelessWidget {
  final LanguageService languageService;

  const LanguageToggle({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageButton(
            label: 'EN',
            isSelected: languageService.isEnglish,
            onTap: () => languageService.switchLanguage(AppLanguage.en),
          ),
          _LanguageButton(
            label: 'VI',
            isSelected: languageService.isVietnamese,
            onTap: () => languageService.switchLanguage(AppLanguage.vi),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<_LanguageButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.accent
                : _isHovered
                    ? AppColors.accent.withOpacity(0.2)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: widget.isSelected
                  ? AppColors.primaryBg
                  : _isHovered
                      ? AppColors.accent
                      : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
