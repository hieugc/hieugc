import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../services/language_service.dart';
import '../common/section_title.dart';
import '../common/animated_card.dart';

class ProjectsSection extends StatelessWidget {
  final LanguageService languageService;

  const ProjectsSection({
    super.key,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context, mobile: 1, tablet: 2, desktop: 3);
    final projects = languageService.projects;
    final aspectRatio = Responsive.isMobile(context) ? 0.75 : (Responsive.isDesktop(context) ? 0.8 : 0.95);

    return Container(
      color: AppColors.cardBg.withValues(alpha: 0.3),
      padding: Responsive.sectionPadding(context),
      child: Container(
        constraints: Responsive.contentConstraints(),
        padding: Responsive.pagePadding(context),
        child: Column(
          children: [
            SectionTitle(title: languageService.projectsTitle),
            const SizedBox(height: 60),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: aspectRatio,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return _ProjectCard(
                  project: project,
                  languageService: languageService,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final LanguageService languageService;

  const _ProjectCard({
    required this.project,
    required this.languageService,
  });

  @override
  Widget build(BuildContext context) {
    final techStack = (project['techStack'] as List<dynamic>?)?.cast<String>() ?? [];

    return AnimatedCard(
      onTap: () => _showProjectDetails(context, project),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
              color: AppColors.primaryBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(color: AppColors.accent, width: 3),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.code,
                size: 60,
                color: AppColors.accent.withValues(alpha: 0.3),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      project['category'] ?? '',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      project['description'] ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: techStack.take(3).map<Widget>((tech) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBg,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    )).toList(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        languageService.viewDetailsButton,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: AppColors.accent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context, Map<String, dynamic> project) {
    final keyFeatures = (project['keyFeatures'] as List<dynamic>?)?.cast<String>() ?? [];
    final techStack = (project['techStack'] as List<dynamic>?)?.cast<String>() ?? [];
    final isMobile = Responsive.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    final dialogWidth = isMobile ? screenWidth * 0.9 : screenWidth * 0.6;
    final dialogMaxWidth = isMobile ? screenWidth * 0.9 : 800.0;
    final dialogMaxHeight = isMobile ? screenHeight * 0.85 : screenHeight * 0.8;
    final padding = isMobile ? 16.0 : 32.0;
    final titleFontSize = isMobile ? 20.0 : 28.0;
    final sectionTitleFontSize = isMobile ? 16.0 : 18.0;
    final bodyFontSize = isMobile ? 13.0 : 14.0;
    final spacingLarge = isMobile ? 16.0 : 24.0;
    final spacingSmall = isMobile ? 8.0 : 12.0;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.cardBg,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 40,
          vertical: isMobile ? 24 : 40,
        ),
        child: Container(
          width: dialogWidth,
          constraints: BoxConstraints(
            maxWidth: dialogMaxWidth,
            maxHeight: dialogMaxHeight,
          ),
          child: Stack(
            children: [
              // Content
              SingleChildScrollView(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title with right padding for close button
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        project['title'] ?? '',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: spacingSmall),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 10 : 12,
                        vertical: isMobile ? 4 : 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        project['category'] ?? '',
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: spacingLarge),
                    Text(
                      languageService.isVietnamese ? 'Mô tả' : 'Description',
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: spacingSmall),
                    Text(
                      project['description'] ?? '',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: spacingLarge),
                    Text(
                      languageService.isVietnamese ? 'Vai trò' : 'Role',
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: spacingSmall),
                    Text(
                      project['role'] ?? '',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: spacingLarge),
                    Text(
                      languageService.isVietnamese ? 'Tính năng chính' : 'Key Features',
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: spacingSmall),
                    ...keyFeatures.map((feature) => Padding(
                      padding: EdgeInsets.only(bottom: isMobile ? 6 : 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: isMobile ? 14 : 16,
                            color: AppColors.accent,
                          ),
                          SizedBox(width: isMobile ? 6 : 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontSize: bodyFontSize,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: spacingLarge),
                    Text(
                      languageService.isVietnamese ? 'Công nghệ' : 'Tech Stack',
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: spacingSmall),
                    Wrap(
                      spacing: isMobile ? 8 : 12,
                      runSpacing: isMobile ? 8 : 12,
                      children: techStack.map<Widget>((tech) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 12 : 16,
                          vertical: isMobile ? 6 : 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBg,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.accent),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )).toList(),
                    ),
                    if (project['url'] != null && (project['url'] as String).isNotEmpty) ...[
                      SizedBox(height: spacingLarge),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(project['url']);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          }
                        },
                        icon: Icon(Icons.open_in_new, size: isMobile ? 16 : 18),
                        label: Text(languageService.isVietnamese ? 'Truy cập website' : 'Visit Website'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 16 : 24,
                            vertical: isMobile ? 10 : 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Absolute positioned close button
              Positioned(
                top: isMobile ? 8 : 12,
                right: isMobile ? 8 : 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBg.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppColors.textPrimary,
                      size: isMobile ? 20 : 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.all(isMobile ? 6 : 8),
                    constraints: const BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
