import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppLanguage { vi, en }

class LanguageService extends ChangeNotifier {
  AppLanguage _currentLanguage = AppLanguage.en;
  Map<String, dynamic>? _data;
  bool _isLoading = true;

  AppLanguage get currentLanguage => _currentLanguage;
  bool get isLoading => _isLoading;
  bool get isVietnamese => _currentLanguage == AppLanguage.vi;
  bool get isEnglish => _currentLanguage == AppLanguage.en;

  // Get current language data
  Map<String, dynamic>? get data {
    if (_data == null) return null;
    return _data![_currentLanguage == AppLanguage.vi ? 'vi' : 'en'];
  }

  // Load JSON data from assets
  Future<void> loadData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/information.json');
      _data = json.decode(jsonString);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error loading language data: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  // Switch language
  void switchLanguage(AppLanguage language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }

  // Toggle between languages
  void toggleLanguage() {
    _currentLanguage = _currentLanguage == AppLanguage.vi
        ? AppLanguage.en
        : AppLanguage.vi;
    notifyListeners();
  }

  // Getters for personal info
  String get name => data?['personal']?['name'] ?? '';
  String get title => data?['personal']?['title'] ?? '';
  String get email => data?['personal']?['email'] ?? '';
  String get phone => data?['personal']?['phone'] ?? '';
  String get birthday => data?['personal']?['birthday'] ?? '';
  String get github => data?['personal']?['github'] ?? '';
  String get facebook => data?['personal']?['facebook'] ?? '';
  String get linkedin => data?['personal']?['linkedin'] ?? '';
  String get avatarPath => data?['personal']?['avatarPath'] ?? '';
  String get resumePath => data?['personal']?['resumePath'] ?? '';

  // Getters for summary
  String get summary => data?['summary'] ?? '';
  String get careerGoal => data?['careerGoal'] ?? '';

  // Getters for statistics
  List<Map<String, dynamic>> get statistics {
    final stats = data?['statistics'] as List<dynamic>?;
    return stats?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  // Getters for services
  List<Map<String, dynamic>> get services {
    final svcs = data?['services'] as List<dynamic>?;
    return svcs?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  // Getters for projects
  List<Map<String, dynamic>> get projects {
    final projs = data?['projects'] as List<dynamic>?;
    return projs?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  // Getters for skills
  Map<String, dynamic> get skills => data?['skills'] ?? {};

  // Getters for work experience
  Map<String, dynamic> get workExperience => data?['workExperience'] ?? {};

  // Getters for education
  Map<String, dynamic> get education => data?['education'] ?? {};

  // Getters for section titles
  String get servicesTitle => data?['sectionTitles']?['services'] ?? '';
  String get projectsTitle => data?['sectionTitles']?['projects'] ?? '';
  String get skillsTitle => data?['sectionTitles']?['skills'] ?? '';
  String get experienceTitle => data?['sectionTitles']?['experience'] ?? '';
  String get educationTitle => data?['sectionTitles']?['education'] ?? '';
  String get contactTitle => data?['sectionTitles']?['contact'] ?? '';

  // Getters for buttons
  String get viewWorkButton => data?['buttons']?['viewWork'] ?? '';
  String get viewDetailsButton => data?['buttons']?['viewDetails'] ?? '';
  String get downloadResumeButton => data?['buttons']?['downloadResume'] ?? '';
  String get contactMeButton => data?['buttons']?['contactMe'] ?? '';

  // Social links
  Map<String, String> get socialLinks => {
    'github': github,
    'email': 'mailto:$email',
  };

  // Navigation labels
  String get navHome => data?['navigation']?['home'] ?? 'Home';
  String get navPortfolio => data?['navigation']?['portfolio'] ?? 'Portfolio';
  String get navExperience => data?['navigation']?['experience'] ?? 'Experience';
  String get navAbout => data?['navigation']?['about'] ?? 'About';
  String get navContact => data?['navigation']?['contact'] ?? 'Contact';
}
