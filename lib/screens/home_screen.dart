import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../config/colors.dart';
import '../config/responsive.dart';
import '../services/language_service.dart';
import 'layouts/home_mobile_layout.dart';
import 'layouts/home_desktop_layout.dart';

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
      return const Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
      );
    }

    // Mobile Layout
    if (isMobile) {
      return HomeMobileLayout(
        languageService: langService,
        scrollController: _scrollController,
        scaffoldKey: _scaffoldKey,
        onScrollToSection: _scrollToSection,
        isScrolled: _isScrolled,
      );
    }

    // Desktop/Tablet Layout
    return HomeDesktopLayout(
      languageService: langService,
      scrollController: _scrollController,
      onScrollToSection: _scrollToSection,
    );
  }
}
