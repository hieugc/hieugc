import 'package:flutter/material.dart';
import 'responsive.dart';

/// Responsive sizing configuration for different device types
/// Usage: AppSizes.heading1(context), AppSizes.cardPadding(context), etc.
class AppSizes {
  // ============================================
  // FONT SIZES
  // ============================================

  // Headings
  static double heading1(BuildContext context) {
    return Responsive.value(context, mobile: 28, tablet: 36, desktop: 42);
  }

  static double heading2(BuildContext context) {
    return Responsive.value(context, mobile: 24, tablet: 28, desktop: 32);
  }

  static double heading3(BuildContext context) {
    return Responsive.value(context, mobile: 20, tablet: 22, desktop: 24);
  }

  static double heading4(BuildContext context) {
    return Responsive.value(context, mobile: 18, tablet: 20, desktop: 22);
  }

  // Body Text
  static double bodyLarge(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 17, desktop: 18);
  }

  static double bodyMedium(BuildContext context) {
    return Responsive.value(context, mobile: 14, tablet: 15, desktop: 16);
  }

  static double bodySmall(BuildContext context) {
    return Responsive.value(context, mobile: 12, tablet: 13, desktop: 14);
  }

  // Labels & Captions
  static double label(BuildContext context) {
    return Responsive.value(context, mobile: 11, tablet: 12, desktop: 13);
  }

  static double caption(BuildContext context) {
    return Responsive.value(context, mobile: 10, tablet: 11, desktop: 12);
  }

  // Navigation
  static double navItem(BuildContext context) {
    return Responsive.value(context, mobile: 14, tablet: 14, desktop: 14);
  }

  // Button Text
  static double buttonText(BuildContext context) {
    return Responsive.value(context, mobile: 14, tablet: 15, desktop: 16);
  }

  // ============================================
  // SPACING & PADDING
  // ============================================

  // Section Spacing
  static double sectionSpacing(BuildContext context) {
    return Responsive.value(context, mobile: 60, tablet: 80, desktop: 100);
  }

  static double sectionPaddingHorizontal(BuildContext context) {
    return Responsive.value(context, mobile: 20, tablet: 40, desktop: 60);
  }

  static double sectionPaddingVertical(BuildContext context) {
    return Responsive.value(context, mobile: 40, tablet: 60, desktop: 80);
  }

  // Card Padding
  static double cardPadding(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 20, desktop: 24);
  }

  static double cardPaddingSmall(BuildContext context) {
    return Responsive.value(context, mobile: 12, tablet: 14, desktop: 16);
  }

  // Item Spacing
  static double itemSpacing(BuildContext context) {
    return Responsive.value(context, mobile: 12, tablet: 16, desktop: 20);
  }

  static double itemSpacingSmall(BuildContext context) {
    return Responsive.value(context, mobile: 8, tablet: 10, desktop: 12);
  }

  // ============================================
  // COMPONENT SIZES
  // ============================================

  // Avatar
  static double avatarSize(BuildContext context) {
    return Responsive.value(context, mobile: 80, tablet: 100, desktop: 120);
  }

  static double avatarSizeSmall(BuildContext context) {
    return Responsive.value(context, mobile: 40, tablet: 48, desktop: 56);
  }

  // Icon Sizes
  static double iconLarge(BuildContext context) {
    return Responsive.value(context, mobile: 48, tablet: 56, desktop: 64);
  }

  static double iconMedium(BuildContext context) {
    return Responsive.value(context, mobile: 24, tablet: 28, desktop: 32);
  }

  static double iconSmall(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 18, desktop: 20);
  }

  // Button Sizes
  static double buttonHeight(BuildContext context) {
    return Responsive.value(context, mobile: 44, tablet: 48, desktop: 52);
  }

  static double buttonPaddingHorizontal(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 20, desktop: 24);
  }

  // Social Button
  static double socialButtonSize(BuildContext context) {
    return Responsive.value(context, mobile: 36, tablet: 40, desktop: 44);
  }

  static double socialIconSize(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 18, desktop: 20);
  }

  // ============================================
  // CARD DIMENSIONS
  // ============================================

  // Project Card
  static double projectCardImageHeight(BuildContext context) {
    return Responsive.value(context, mobile: 140, tablet: 150, desktop: 160);
  }

  // Stat Card
  static double statCardMinWidth(BuildContext context) {
    return Responsive.value(context, mobile: 140, tablet: 160, desktop: 180);
  }

  // Service Card
  static double serviceCardIconSize(BuildContext context) {
    return Responsive.value(context, mobile: 40, tablet: 48, desktop: 56);
  }

  // ============================================
  // SIDEBAR (Desktop only)
  // ============================================

  static double sidebarWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth * 0.28).clamp(260.0, 360.0);
  }

  static double sidebarPadding(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 20, desktop: 24);
  }

  // ============================================
  // NAVBAR
  // ============================================

  static double navbarHeight(BuildContext context) {
    return Responsive.value(context, mobile: 56, tablet: 60, desktop: 64);
  }

  static double navbarPaddingHorizontal(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 20, desktop: 24);
  }

  // ============================================
  // BORDER RADIUS
  // ============================================

  static double borderRadiusSmall(BuildContext context) {
    return Responsive.value(context, mobile: 4, tablet: 6, desktop: 8);
  }

  static double borderRadiusMedium(BuildContext context) {
    return Responsive.value(context, mobile: 8, tablet: 10, desktop: 12);
  }

  static double borderRadiusLarge(BuildContext context) {
    return Responsive.value(context, mobile: 12, tablet: 16, desktop: 20);
  }

  // ============================================
  // LINE HEIGHT
  // ============================================

  static double lineHeightTight = 1.2;
  static double lineHeightNormal = 1.5;
  static double lineHeightRelaxed = 1.7;
  static double lineHeightLoose = 2.0;

  // ============================================
  // GRID
  // ============================================

  static double gridSpacing(BuildContext context) {
    return Responsive.value(context, mobile: 16, tablet: 20, desktop: 24);
  }

  static double gridItemAspectRatio(BuildContext context) {
    return Responsive.value(context, mobile: 0.75, tablet: 0.85, desktop: 0.9);
  }

  // ============================================
  // MAX WIDTHS
  // ============================================

  static const double maxContentWidth = 1200.0;
  static const double maxTextWidth = 800.0;
  static const double maxCardWidth = 400.0;
}
