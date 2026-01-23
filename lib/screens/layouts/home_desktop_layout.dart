import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';
import '../../widgets/navigation/sidebar.dart';
import '../../widgets/navigation/content_nav_bar.dart';
import '../../widgets/sections/summary_section.dart';
import '../../widgets/sections/statistics_section.dart';
import '../../widgets/sections/projects_section.dart';
import '../../widgets/sections/experience_section.dart';
import '../../widgets/sections/services_section.dart';
import '../../widgets/sections/desktop_footer.dart';
import '../../widgets/common/back_to_top_button.dart';

class HomeDesktopLayout extends StatelessWidget {
  final LanguageService languageService;
  final AutoScrollController scrollController;
  final Future<void> Function(int) onScrollToSection;

  const HomeDesktopLayout({
    super.key,
    required this.languageService,
    required this.scrollController,
    required this.onScrollToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: Row(
        children: [
          // Fixed Sidebar
          Sidebar(
            languageService: languageService,
          ),

          // Scrollable Main Content
          Expanded(
            child: Stack(
              children: [
                ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 80),
                  children: [
                    // Summary Section (Index 0)
                    AutoScrollTag(
                      key: const ValueKey(0),
                      controller: scrollController,
                      index: 0,
                      child: SummarySection(languageService: languageService),
                    ),

                    const SizedBox(height: 60),

                    // Statistics Section
                    StatisticsSection(languageService: languageService),

                    const SizedBox(height: 60),

                    // Experience & Education Section (Index 1)
                    AutoScrollTag(
                      key: const ValueKey(1),
                      controller: scrollController,
                      index: 1,
                      child: ExperienceSection(languageService: languageService),
                    ),

                    const SizedBox(height: 60),

                    // Projects Section (Index 2)
                    AutoScrollTag(
                      key: const ValueKey(2),
                      controller: scrollController,
                      index: 2,
                      child: ProjectsSection(languageService: languageService),
                    ),

                    const SizedBox(height: 60),

                    // Education Section (Index 3) - placeholder for navigation
                    AutoScrollTag(
                      key: const ValueKey(3),
                      controller: scrollController,
                      index: 3,
                      child: const SizedBox.shrink(),
                    ),

                    // Services Section (Index 4)
                    AutoScrollTag(
                      key: const ValueKey(4),
                      controller: scrollController,
                      index: 4,
                      child: ServicesSection(languageService: languageService),
                    ),

                    const SizedBox(height: 60),

                    // Footer/Contact Section (Index 5)
                    AutoScrollTag(
                      key: const ValueKey(5),
                      controller: scrollController,
                      index: 5,
                      child: DesktopFooter(languageService: languageService),
                    ),
                  ],
                ),

                // Sticky Navigation Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ContentNavBar(
                    scrollController: scrollController,
                    onMenuTap: onScrollToSection,
                    languageService: languageService,
                  ),
                ),

                // Back to Top Button
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: BackToTopButton(
                    onPressed: () => onScrollToSection(0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
