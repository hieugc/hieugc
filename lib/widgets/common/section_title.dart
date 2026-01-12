import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centered;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 28 : 40,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          margin: EdgeInsets.only(
            top: 16,
            left: centered ? 0 : 0,
          ),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
