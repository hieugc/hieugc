import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../config/colors.dart';
import '../../services/language_service.dart';
import '../../widgets/navigation/portfolio_app_bar.dart';
import '../../widgets/navigation/mobile_drawer.dart';
import '../../widgets/sections/hero_section.dart';
import '../../widgets/sections/statistics_section.dart';
import '../../widgets/sections/projects_section.dart';
import '../../widgets/sections/skills_section.dart';
import '../../widgets/sections/experience_section.dart';
import '../../widgets/sections/services_section.dart';
import '../../widgets/sections/footer_section.dart';
import '../../widgets/common/back_to_top_button.dart';

class HomeMobileLayout extends StatelessWidget {
  final LanguageService languageService;
  final AutoScrollController scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Future<void> Function(int) onScrollToSection;
  final bool isScrolled;

  const HomeMobileLayout({
    super.key,
    required this.languageService,
    required this.scrollController,
    required this.scaffoldKey,
    required this.onScrollToSection,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryBg,
      endDrawer: MobileDrawer(
        onMenuTap: onScrollToSection,
        languageService: languageService,
      ),
      body: Stack(
        children: [
          // Main Content
          ListView(
            controller: scrollController,
            children: [
              // Hero Section (Index 0)
              AutoScrollTag(
                key: const ValueKey(0),
                controller: scrollController,
                index: 0,
                child: HeroSection(
                  onViewWorkPressed: () => onScrollToSection(1),
                  languageService: languageService,
                ),
              ),

              const SizedBox(height: 80),

              // Statistics Section
              StatisticsSection(languageService: languageService),

              const SizedBox(height: 80),

              // Experience & Education Section (Index 1)
              AutoScrollTag(
                key: const ValueKey(1),
                controller: scrollController,
                index: 1,
                child: ExperienceSection(languageService: languageService),
              ),

              const SizedBox(height: 80),

              // Projects Section (Index 2)
              AutoScrollTag(
                key: const ValueKey(2),
                controller: scrollController,
                index: 2,
                child: ProjectsSection(languageService: languageService),
              ),

              const SizedBox(height: 80),

              // Skills Section (Index 3)
              AutoScrollTag(
                key: const ValueKey(3),
                controller: scrollController,
                index: 3,
                child: SkillsSection(languageService: languageService),
              ),

              const SizedBox(height: 80),

              // Services Section (Index 4)
              AutoScrollTag(
                key: const ValueKey(4),
                controller: scrollController,
                index: 4,
                child: ServicesSection(languageService: languageService),
              ),

              const SizedBox(height: 80),

              // Footer/Contact Section (Index 5)
              AutoScrollTag(
                key: const ValueKey(5),
                controller: scrollController,
                index: 5,
                child: FooterSection(languageService: languageService),
              ),
            ],
          ),

          // Sticky App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: PortfolioAppBar(
                scrollController: scrollController,
                onMenuTap: onScrollToSection,
                languageService: languageService,
              ),
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

          // Floating Menu Button (visible when nav is hidden at top)
          if (!isScrolled)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBg.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  color: AppColors.textPrimary,
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
