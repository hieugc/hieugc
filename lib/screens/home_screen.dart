import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../config/colors.dart';
import '../config/responsive.dart';
import '../services/language_service.dart';
import '../widgets/navigation/portfolio_app_bar.dart';
import '../widgets/navigation/mobile_drawer.dart';
import '../widgets/navigation/sidebar.dart';
import '../widgets/navigation/content_nav_bar.dart';
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
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    _scrollController.addListener(_onScroll);
    widget.languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    widget.languageService.removeListener(_onLanguageChanged);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
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
    final isMobile = Responsive.isMobile(context);

    if (langService.isLoading) {
      return Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
      );
    }

    // Mobile Layout - Keep current design
    if (isMobile) {
      return _buildMobileLayout(langService);
    }

    // Desktop/Tablet Layout - Two column with fixed sidebar
    return _buildDesktopLayout(langService);
  }

  Widget _buildMobileLayout(LanguageService langService) {
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

              // Skills Section (Index 3)
              AutoScrollTag(
                key: const ValueKey(3),
                controller: _scrollController,
                index: 3,
                child: SkillsSection(languageService: langService),
              ),

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

          // Floating Menu Button (visible when nav is hidden at top)
          if (!_isScrolled)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBg.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  color: AppColors.textPrimary,
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(LanguageService langService) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: Row(
        children: [
          // Fixed Sidebar
          Sidebar(
            languageService: langService,
          ),

          // Scrollable Main Content
          Expanded(
            child: Stack(
              children: [
                ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 80),
                  children: [
                    // Summary Section (Index 0)
                    AutoScrollTag(
                      key: const ValueKey(0),
                      controller: _scrollController,
                      index: 0,
                      child: _SummarySection(languageService: langService),
                    ),

                    const SizedBox(height: 60),

                    // Statistics Section
                    StatisticsSection(languageService: langService),

                    const SizedBox(height: 60),

                    // Projects Section (Index 1)
                    AutoScrollTag(
                      key: const ValueKey(1),
                      controller: _scrollController,
                      index: 1,
                      child: ProjectsSection(languageService: langService),
                    ),

                    const SizedBox(height: 60),

                    // Experience & Education Section (Index 2)
                    AutoScrollTag(
                      key: const ValueKey(2),
                      controller: _scrollController,
                      index: 2,
                      child: ExperienceSection(languageService: langService),
                    ),

                    const SizedBox(height: 60),

                    // Education Section (Index 3) - shares section with Experience
                    AutoScrollTag(
                      key: const ValueKey(3),
                      controller: _scrollController,
                      index: 3,
                      child: const SizedBox.shrink(),
                    ),

                    // Services Section (Index 4)
                    AutoScrollTag(
                      key: const ValueKey(4),
                      controller: _scrollController,
                      index: 4,
                      child: ServicesSection(languageService: langService),
                    ),

                    const SizedBox(height: 60),

                    // Footer/Contact Section (Index 5)
                    AutoScrollTag(
                      key: const ValueKey(5),
                      controller: _scrollController,
                      index: 5,
                      child: _DesktopFooter(languageService: langService),
                    ),
                  ],
                ),

                // Sticky Navigation Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ContentNavBar(
                    scrollController: _scrollController,
                    onMenuTap: _scrollToSection,
                    languageService: langService,
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
          ),
        ],
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  final LanguageService languageService;

  const _SummarySection({required this.languageService});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageService.isVietnamese ? 'Giới thiệu' : 'About Me',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            languageService.summary,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.textSecondary,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            languageService.careerGoal,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.7,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  final LanguageService languageService;

  const _DesktopFooter({required this.languageService});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.cardBg.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Text(
            languageService.contactTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            languageService.email,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} ${languageService.name}. All rights reserved.',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
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
