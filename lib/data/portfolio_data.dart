import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project.dart';
import '../models/service.dart';
import '../models/skill.dart';
import '../models/statistic.dart';

class PortfolioData {
  // Personal Information
  static const String name = 'Pham Minh Hieu';
  static const String title = '.NET Software Engineer';
  static const String tagline =
      '.NET Software Engineer with 2 years of experience building web systems for government and enterprises, specializing in .NET Core MVC, API, database design, and applying AI to software solutions';
  static const String email = 'hieu.phamgc@gmail.com';
  static const String phone = '0973409127';
  static const String github = 'https://github.com/hieugc/';
  static const String avatarPath = 'assets/images/avatar.jpg';
  static const String resumePath = 'assets/documents/PhamMinhHieu_Fullstack_net.pdf';

  // Statistics
  static const List<Statistic> statistics = [
    Statistic(
      value: '2+',
      label: 'Years Experience',
      icon: Icons.work_outline,
    ),
    Statistic(
      value: '5+',
      label: 'Projects Completed',
      icon: Icons.folder_outlined,
    ),
    Statistic(
      value: 'Gov & Enterprise',
      label: 'Client Sectors',
      icon: Icons.business_outlined,
    ),
    Statistic(
      value: 'Full Stack',
      label: 'Development',
      icon: Icons.code_outlined,
    ),
  ];

  // Services
  static const List<Service> services = [
    Service(
      icon: FontAwesomeIcons.server,
      title: 'Backend Development',
      description:
          'Build robust server-side applications with modern technologies and best practices',
      features: [
        'Build robust server-side applications with .NET Core, ASP.NET MVC',
        'RESTful API design and development',
        'Database design and optimization (SQL Server, MySQL)',
        'Real-time communication with SignalR',
      ],
    ),
    Service(
      icon: FontAwesomeIcons.code,
      title: 'Frontend Development',
      description:
          'Create responsive and interactive user interfaces with modern web technologies',
      features: [
        'Create responsive user interfaces with HTML5/CSS3, JavaScript',
        'Modern frameworks: jQuery, Bootstrap 5',
        'Interactive and dynamic web experiences',
        'Cross-browser compatibility',
      ],
    ),
    Service(
      icon: FontAwesomeIcons.layerGroup,
      title: 'Full Stack Solutions',
      description:
          'End-to-end application development from concept to deployment',
      features: [
        'End-to-end application development',
        'System architecture and database design',
        'API integration and deployment (IIS Server)',
        'Mobile app development with Flutter',
      ],
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'Press Q&A Management System',
      category: 'Government Web Application',
      description:
          'Software that allows journalists to submit questions to the Press Center and transfer them to relevant departments and agencies for responses',
      techStack: ['.NET Core MVC', 'jQuery', 'Bootstrap 5', 'SQL Server'],
      role: 'Full Stack Developer',
      keyFeatures: [
        'SSO authentication and user role-based permissions',
        'API integration for data synchronization with client software',
        'Complete system interface development with Google Maps integration',
        'IIS Server deployment',
      ],
      responsibilities: [
        'Database analysis and design',
        'Backend: SSO account authentication, user permissions',
        'Backend: API integration for data synchronization with client software',
        'Frontend: Developed entire system interface and integrated Google Maps',
        'Deployment: IIS SERVER',
      ],
    ),
    Project(
      title: 'House Exchange Platform',
      category: 'Web & Mobile Application (Graduation Project)',
      description:
          'Software supporting users to exchange houses using points and direct exchange on website and mobile platforms',
      techStack: [
        '.NET Core MVC',
        'SignalR (Hub Protocol)',
        'SQL Server',
        'HTML/CSS/JavaScript',
        'Bootstrap 5',
        'Flutter'
      ],
      role: 'Full Stack Developer',
      keyFeatures: [
        'Point recharge through ZALOPAY payment channels',
        'Real-time chat messaging using SignalR',
        'Circular house exchange algorithm for 3-4 people',
        'Machine learning model to analyze common property prices by area on Google Maps',
      ],
      responsibilities: [
        'Developed complete web and mobile application',
        'Implemented real-time communication with SignalR',
        'Integrated ZALOPAY payment gateway',
        'Built circular exchange algorithm',
        'Applied ML model for price analysis',
      ],
    ),
    Project(
      title: 'Postal & Telecommunications Station Management System',
      category: 'Government Tracking System',
      description:
          'Software to monitor postal and telecommunications station locations in Ho Chi Minh City area',
      techStack: ['Ruby on Rails', 'MySQL', 'Bootstrap 5', 'Google Maps API'],
      role: 'Full Stack Developer',
      keyFeatures: [
        'Business-driven database design and analysis',
        'Real-time station location tracking',
        'Visual data display on Google Maps with interactive markers',
        'Backend and frontend maintenance and development',
      ],
      responsibilities: [
        'Database analysis and design based on business requirements',
        'Maintain and develop backend and frontend',
        'Implement visual data display on Google Maps',
      ],
    ),
    Project(
      title: 'SHTP Website',
      category: 'Corporate News Portal',
      description:
          'News website for Saigon High-Tech Park activities and exploitation project operations',
      techStack: ['DotNetNuke', 'jQuery', 'Bootstrap 3'],
      role: 'Module Developer',
      keyFeatures: [
        'Article publishing workflow module with role-based permissions',
        'Content management system for news and projects',
        'Multi-department collaboration workflow',
      ],
      responsibilities: [
        'Participated in developing and implementing article publishing workflow module',
        'Built role-based publishing system for different departments',
      ],
    ),
    Project(
      title: 'Lavictoire Mobile App',
      category: 'Customer Service Mobile Application',
      description:
          'Mobile application providing comprehensive services for Lavictoire Club customers',
      techStack: ['Flutter', 'REST API', 'Copilot (AI-assisted development)'],
      role: 'Mobile Developer',
      keyFeatures: [
        'User-friendly interface for service displays and browsing',
        'Service booking and reservation features',
        'Real-time backend API integration',
        'AI-assisted development with GitHub Copilot',
      ],
      responsibilities: [
        'Participated in developing display interface for services',
        'Implemented service booking functionality',
        'Integrated REST APIs from backend',
      ],
    ),
  ];

  // Skills organized by category
  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      name: 'Backend',
      skills: [
        Skill(name: '.NET Core', category: 'Backend'),
        Skill(name: 'ASP.NET MVC', category: 'Backend'),
        Skill(name: 'Entity Framework Core', category: 'Backend'),
        Skill(name: 'REST API', category: 'Backend'),
        Skill(name: 'LINQ', category: 'Backend'),
        Skill(name: 'SignalR', category: 'Backend'),
        Skill(name: 'Ruby on Rails', category: 'Backend'),
      ],
    ),
    SkillCategory(
      name: 'Frontend',
      skills: [
        Skill(name: 'HTML5/CSS3', category: 'Frontend'),
        Skill(name: 'JavaScript', category: 'Frontend'),
        Skill(name: 'jQuery', category: 'Frontend'),
        Skill(name: 'Bootstrap', category: 'Frontend'),
        Skill(name: 'Responsive Design', category: 'Frontend'),
      ],
    ),
    SkillCategory(
      name: 'Database',
      skills: [
        Skill(name: 'SQL Server', category: 'Database'),
        Skill(name: 'MySQL', category: 'Database'),
        Skill(name: 'Database Design', category: 'Database'),
        Skill(name: 'Query Optimization', category: 'Database'),
      ],
    ),
    SkillCategory(
      name: 'Tools & Others',
      skills: [
        Skill(name: 'GitLab', category: 'Tools'),
        Skill(name: 'IIS', category: 'Tools'),
        Skill(name: 'Postman', category: 'Tools'),
        Skill(name: 'Flutter', category: 'Mobile'),
        Skill(name: 'DotNetNuke', category: 'CMS'),
        Skill(name: 'Claude AI', category: 'AI Tools'),
        Skill(name: 'Copilot', category: 'AI Tools'),
      ],
    ),
  ];

  // Work Experience
  static const String workCompany = 'Tri Viet JSC';
  static const String workPosition = 'Software Engineer';
  static const String workDuration = 'July 2023 - December 2025';
  static const String workDescription =
      'Full-stack development for government and enterprise web systems, specializing in .NET Core, Ruby on Rails, and Flutter development';
  static const List<String> workProjects = [
    'Press Q&A Management System',
    'Postal & Telecommunications Station Management System',
    'SHTP Website',
    'Lavictoire Mobile App',
  ];

  // Education
  static const String university = 'Ho Chi Minh City University of Technology';
  static const String universityShort = 'HCMC University of Technology';
  static const String degree = 'Bachelor of Computer Science';
  static const String major = 'Computer Science';
  static const String educationDuration = '2019 - 2023';
  static const String gpa = '7.0/10';
  static const String graduationProject = 'House Exchange Platform';
  static const String graduationProjectDescription =
      'Supporting house exchange through points and direct exchange on website and mobile platforms. Features include: ZALOPAY payment integration, real-time chat messaging, circular exchange algorithm for 3-4 people, and machine learning model for property price analysis by area on Google Maps';

  // Social Links
  static const Map<String, String> socialLinks = {
    'github': 'https://github.com/hieugc/',
    'email': 'mailto:hieu.phamgc@gmail.com',
  };

  // Section Titles
  static const String servicesTitle = 'What Can I Do For Your Needs';
  static const String projectsTitle = 'Featured Projects';
  static const String skillsTitle = 'Technical Skills';
  static const String experienceTitle = 'Work Experience';
  static const String educationTitle = 'Education';
  static const String contactTitle = "Let's Build Quality Products Together";

  // CTA Text
  static const String ctaButtonText = 'View My Work';
  static const String projectDetailsButton = 'View Details';
  static const String downloadResumeButton = 'Download Resume';
}
