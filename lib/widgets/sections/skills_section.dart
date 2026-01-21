import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../services/language_service.dart';
import '../common/section_title.dart';

class SkillsSection extends StatelessWidget {
  final LanguageService languageService;

  const SkillsSection({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final skills = languageService.skills;

    return Container(
      constraints: Responsive.contentConstraints(),
      padding: Responsive.pagePadding(context),
      child: Column(
        children: [
          SectionTitle(title: languageService.skillsTitle),
          const SizedBox(height: 60),
          ...skills.entries.map((entry) {
            final categoryData = entry.value as Map<String, dynamic>;
            final title = categoryData['title'] as String? ?? '';
            final items = (categoryData['items'] as List<dynamic>?)?.cast<String>() ?? [];
            return _SkillCategoryWidget(
              categoryName: title,
              skills: items,
            );
          }),
        ],
      ),
    );
  }
}

class _SkillCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<String> skills;

  const _SkillCategoryWidget({
    required this.categoryName,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills.map<Widget>((skill) => _SkillChip(skillName: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String skillName;

  const _SkillChip({required this.skillName});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.accent.withOpacity(0.1)
              : AppColors.cardBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? AppColors.accent : AppColors.border,
            width: _isHovered ? 2 : 1,
          ),
        ),
        child: Text(
          widget.skillName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isHovered ? AppColors.accent : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
