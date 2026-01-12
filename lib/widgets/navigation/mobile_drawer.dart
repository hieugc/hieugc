import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../data/portfolio_data.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onMenuTap;

  const MobileDrawer({
    super.key,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cardBg,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.divider, width: 1),
                ),
              ),
              child: Row(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          PortfolioData.title,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _DrawerItem(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      onMenuTap(0);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.folder_outlined,
                    text: 'Portfolio',
                    onTap: () {
                      Navigator.pop(context);
                      onMenuTap(1);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.work_outline,
                    text: 'Experience',
                    onTap: () {
                      Navigator.pop(context);
                      onMenuTap(2);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.person_outline,
                    text: 'About',
                    onTap: () {
                      Navigator.pop(context);
                      onMenuTap(3);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.mail_outline,
                    text: 'Contact',
                    onTap: () {
                      Navigator.pop(context);
                      onMenuTap(4);
                    },
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.divider, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    PortfolioData.email,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
      ),
      onTap: onTap,
      hoverColor: AppColors.accent.withOpacity(0.1),
    );
  }
}
