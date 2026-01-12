import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../data/portfolio_data.dart';
import '../common/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: Responsive.contentConstraints(),
      padding: Responsive.pagePadding(context),
      child: Column(
        children: [
          const SectionTitle(title: 'Technical Skills'),
          const SizedBox(height: 60),
          ...PortfolioData.skillCategories.map(
            (category) => _SkillCategoryWidget(category: category),
          ),
        ],
      ),
    );
  }
}

class _SkillCategoryWidget extends StatelessWidget {
  final category;

  const _SkillCategoryWidget({required this.category});

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
                category.name,
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
            children: category.skills
                .map<Widget>((skill) => _SkillChip(skill: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final skill;

  const _SkillChip({required this.skill});

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
          widget.skill.name,
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
