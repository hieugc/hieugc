import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../config/colors.dart';
import '../services/language_service.dart';
import '../widgets/navigation/portfolio_app_bar.dart';
import '../widgets/navigation/mobile_drawer.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/statistics_section.dart';
import '../widgets/sections/services_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/footer_section.dart';

class HomeScreen extends StatefulWidget {
  final LanguageService languageService;

  const HomeScreen({
    super.key,
    required this.languageService,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AutoScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    widget.languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    widget.languageService.removeListener(_onLanguageChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  Future<void> _scrollToSection(int index) async {
    await _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    final langService = widget.languageService;

    if (langService.isLoading) {
      return Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.primaryBg,
      endDrawer: MobileDrawer(
        onMenuTap: _scrollToSection,
        languageService: langService,
      ),
      body: Stack(
        children: [
          // Main Content
          ListView(
            controller: _scrollController,
            children: [
              // Hero Section (Index 0)
              AutoScrollTag(
                key: const ValueKey(0),
                controller: _scrollController,
                index: 0,
                child: HeroSection(
                  onViewWorkPressed: () => _scrollToSection(1),
                  languageService: langService,
                ),
              ),

              const SizedBox(height: 80),

              // Statistics Section
              StatisticsSection(languageService: langService),

              const SizedBox(height: 80),

              // Services Section
              ServicesSection(languageService: langService),

              const SizedBox(height: 80),

              // Projects Section (Index 1)
              AutoScrollTag(
                key: const ValueKey(1),
                controller: _scrollController,
                index: 1,
                child: ProjectsSection(languageService: langService),
              ),

              const SizedBox(height: 80),

              // Skills Section
              SkillsSection(languageService: langService),

              const SizedBox(height: 80),

              // Experience & Education Section (Index 2)
              AutoScrollTag(
                key: const ValueKey(2),
                controller: _scrollController,
                index: 2,
                child: ExperienceSection(languageService: langService),
              ),

              const SizedBox(height: 80),

              // Footer/Contact Section (Index 4)
              AutoScrollTag(
                key: const ValueKey(4),
                controller: _scrollController,
                index: 4,
                child: FooterSection(languageService: langService),
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
                scrollController: _scrollController,
                onMenuTap: _scrollToSection,
                languageService: langService,
              ),
            ),
          ),

          // Back to Top Button
          Positioned(
            bottom: 30,
            right: 30,
            child: _BackToTopButton(
              onPressed: () => _scrollToSection(0),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _BackToTopButton({required this.onPressed});

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: _isHovered ? AppColors.accentHover : AppColors.accent,
          elevation: _isHovered ? 8 : 4,
          child: const Icon(
            Icons.arrow_upward,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
