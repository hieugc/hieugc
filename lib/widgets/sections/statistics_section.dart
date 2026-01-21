import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../services/language_service.dart';

class StatisticsSection extends StatelessWidget {
  final LanguageService languageService;

  const StatisticsSection({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final columns = Responsive.gridColumns(context, mobile: 2, tablet: 4, desktop: 4);
    final stats = languageService.statistics;

    return Container(
      constraints: Responsive.contentConstraints(),
      padding: Responsive.pagePadding(context),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: isMobile ? 1.5 : 1.8,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return _StatCard(
            value: stat['value'] ?? '',
            label: stat['label'] ?? '',
          );
        },
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? AppColors.accent : AppColors.border,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _isHovered ? AppColors.accent : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
