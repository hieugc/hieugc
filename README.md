# Pham Minh Hieu - Portfolio Website

A modern, responsive portfolio website built with Flutter Web showcasing my experience as a .NET Software Engineer.

## Features

- 🎨 Modern dark theme design with gold accents
- 📱 Fully responsive (Mobile, Tablet, Desktop)
- ⚡ Smooth animations and transitions
- 🎯 Clean, professional UI
- 🚀 Fast performance
- 📊 Showcases 5+ projects with detailed information
- 💼 Work experience and education timeline
- 🛠️ Complete technical skills breakdown

## Tech Stack

- **Framework:** Flutter Web
- **UI Components:** Custom widgets with Material Design
- **Animations:** animated_text_kit, visibility_detector
- **Responsive:** responsive_framework
- **Typography:** Google Fonts (Poppins, Inter)
- **Icons:** Font Awesome Flutter
- **Deployment:** Firebase Hosting

## Project Structure

```
lib/
├── config/          # Theme, colors, responsive utilities
├── models/          # Data models (Project, Service, Skill, etc.)
├── data/            # Static portfolio data
├── widgets/
│   ├── common/      # Reusable components
│   ├── navigation/  # App bar and drawer
│   └── sections/    # Page sections
├── screens/         # Main screens
└── main.dart        # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. **Install Flutter:**
   ```bash
   # macOS (using Homebrew)
   brew install flutter

   # Or download from: https://docs.flutter.dev/get-started/install
   ```

2. **Verify Flutter installation:**
   ```bash
   flutter doctor
   ```

3. **Get dependencies:**
   ```bash
   flutter pub get
   ```

### Running the App

**Development mode:**
```bash
flutter run -d chrome
```

**Build for production:**
```bash
flutter build web --release
```

## Deployment

### Firebase Hosting

1. **Install Firebase CLI:**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase:**
   ```bash
   firebase login
   ```

3. **Initialize Firebase (already configured):**
   ```bash
   firebase init hosting
   ```

4. **Build and deploy:**
   ```bash
   flutter build web --release
   firebase deploy
   ```

### GitHub Pages

```bash
flutter build web --release --base-href "/hieugc/"
# Copy build/web contents to gh-pages branch
```

### Vercel

1. Connect your GitHub repository to Vercel
2. Configure:
   - Build Command: `flutter build web --release`
   - Output Directory: `build/web`
3. Deploy

## Portfolio Sections

1. **Hero Section** - Introduction with profile photo and tagline
2. **Statistics** - Key metrics (2+ years experience, 5+ projects)
3. **Services** - Backend, Frontend, and Full Stack offerings
4. **Projects** - 5 featured projects with detailed descriptions
5. **Skills** - Technical skills organized by category
6. **Experience** - Work history at Tri Viet JSC
7. **Education** - HCMC University of Technology
8. **Contact** - Social links and contact information

## Key Projects Featured

1. **Press Q&A Management System** - Government web application
2. **House Exchange Platform** - Graduation project (Web + Mobile)
3. **Post Office Management System** - Tracking system
4. **SHTP Website** - Corporate news portal
5. **Lavictoire Mobile App** - Customer service application

## Customization

### Update Personal Information

Edit `lib/data/portfolio_data.dart` to update:
- Personal information (name, email, etc.)
- Projects
- Skills
- Work experience
- Education

### Change Theme Colors

Edit `lib/config/colors.dart` to customize colors:
- Background colors
- Accent colors
- Text colors

### Modify Sections

Each section is a separate widget in `lib/widgets/sections/`. You can:
- Add new sections
- Modify existing layouts
- Change animations

## Performance

- Lighthouse Score: 90+
- First Contentful Paint: < 2s
- Optimized assets and images
- Lazy loading for better performance

## Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Mobile browsers

## Contact

- **Email:** hieu.phamgc@gmail.com
- **GitHub:** https://github.com/hieugc/
- **Portfolio:** [Your deployed URL]

## License

© 2026 Pham Minh Hieu. All rights reserved.

---

Built with ❤️ using Flutter Web
