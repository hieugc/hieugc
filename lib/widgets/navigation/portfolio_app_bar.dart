import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/responsive.dart';
import '../../data/portfolio_data.dart';

class PortfolioAppBar extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int) onMenuTap;

  const PortfolioAppBar({
    super.key,
    required this.scrollController,
    required this.onMenuTap,
  });

  @override
  State<PortfolioAppBar> createState() => _PortfolioAppBarState();
}

class _PortfolioAppBarState extends State<PortfolioAppBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppColors.cardBg.withOpacity(0.95)
            : Colors.transparent,
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo/Name
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '👨‍💻',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 12),
                if (!isMobile)
                  Text(
                    PortfolioData.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
              ],
            ),

            // Navigation Menu
            if (!isMobile)
              Row(
                children: [
                  _NavItem(
                    text: 'Home',
                    onTap: () => widget.onMenuTap(0),
                  ),
                  _NavItem(
                    text: 'Portfolio',
                    onTap: () => widget.onMenuTap(1),
                  ),
                  _NavItem(
                    text: 'Experience',
                    onTap: () => widget.onMenuTap(2),
                  ),
                  _NavItem(
                    text: 'About',
                    onTap: () => widget.onMenuTap(3),
                  ),
                  _NavItem(
                    text: 'Contact',
                    onTap: () => widget.onMenuTap(4),
                  ),
                ],
              )
            else
              // Mobile Menu Button
              IconButton(
                icon: const Icon(Icons.menu),
                color: AppColors.textPrimary,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _isHovered ? AppColors.accent : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _isHovered ? AppColors.accent : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
