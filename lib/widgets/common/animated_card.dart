import 'package:flutter/material.dart';
import '../../config/colors.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double elevation;

  const AnimatedCard({
    super.key,
    required this.child,
    this.onTap,
    this.elevation = 0,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          child: Card(
            elevation: _isHovered ? 16 : widget.elevation,
            shadowColor: _isHovered
                ? AppColors.accent.withOpacity(0.3)
                : Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: _isHovered ? AppColors.accent : AppColors.border,
                width: _isHovered ? 2 : 1,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
