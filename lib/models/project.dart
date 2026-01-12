class Project {
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String role;
  final List<String> keyFeatures;
  final List<String>? responsibilities;
  final String? imagePath;
  final String? link;

  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.role,
    required this.keyFeatures,
    this.responsibilities,
    this.imagePath,
    this.link,
  });
}
