import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'screens/home_screen.dart';
import 'services/language_service.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final LanguageService _languageService = LanguageService();

  @override
  void initState() {
    super.initState();
    _languageService.loadData();
    _languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    _languageService.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pham Minh Hieu - .NET Software Engineer',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(languageService: _languageService),
    );
  }
}
