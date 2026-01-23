import 'package:flutter/material.dart';
import '../../config/colors.dart';

class BackToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const BackToTopButton({super.key, required this.onPressed});

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
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
