import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../data/portfolio_data.dart';
import '../common/section_title.dart';
import '../common/animated_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context, mobile: 1, tablet: 2, desktop: 3);

    return Container(
      constraints: Responsive.contentConstraints(),
      padding: Responsive.pagePadding(context),
      child: Column(
        children: [
          const SectionTitle(title: 'What Can I Do For Your Needs'),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 0.85,
            ),
            itemCount: PortfolioData.services.length,
            itemBuilder: (context, index) {
              final service = PortfolioData.services[index];
              return _ServiceCard(service: service);
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                service.icon,
                size: 32,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              service.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            ...service.features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 16,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
