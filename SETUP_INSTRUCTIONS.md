# Portfolio Setup Instructions

Your Flutter Web portfolio has been fully generated! Here's how to get it running.

## What's Been Created

✅ Complete Flutter Web project structure
✅ 8 section widgets (Hero, Statistics, Services, Projects, Skills, Experience, Education, Footer)
✅ Responsive design for Mobile, Tablet, and Desktop
✅ Dark theme with gold accents matching your template
✅ All your personal data, projects, and skills integrated
✅ Smooth animations and hover effects
✅ Firebase deployment configuration
✅ SEO-optimized meta tags

## Next Steps

### 1. Install Flutter

**macOS (recommended method):**
```bash
brew install flutter
```

**Or download manually:**
Visit https://docs.flutter.dev/get-started/install/macos

**Verify installation:**
```bash
flutter doctor
```

### 2. Get Dependencies

```bash
cd /Users/hieupham/Projects/hieugc
flutter pub get
```

### 3. Run the Portfolio

**In Chrome (recommended for development):**
```bash
flutter run -d chrome
```

**Or build for production:**
```bash
flutter build web --release
```

The built files will be in `build/web/`

## Project Structure

```
hieugc/
├── lib/
│   ├── config/              # Theme, colors, responsive settings
│   ├── models/              # Data models
│   ├── data/
│   │   └── portfolio_data.dart  # ALL YOUR CONTENT HERE
│   ├── widgets/
│   │   ├── common/          # Reusable components
│   │   ├── navigation/      # App bar, drawer
│   │   └── sections/        # All page sections
│   ├── screens/
│   │   └── home_screen.dart # Main page
│   └── main.dart            # App entry point
├── assets/
│   ├── images/
│   │   └── avatar.jpg       # Your photo
│   └── documents/
│       └── PhamMinhHieu_Fullstack_net.pdf
├── web/
│   ├── index.html           # SEO meta tags
│   └── manifest.json        # PWA config
├── pubspec.yaml             # Dependencies
├── firebase.json            # Firebase hosting config
└── README.md                # Full documentation
```

## Key Features Implemented

### 1. Hero Section
- Professional photo with glowing border
- Animated typing effect for tagline
- Social links (GitHub, Email)
- "View My Work" CTA button

### 2. Statistics Section
- 4 stat cards with hover effects
- 2+ Years Experience
- 5+ Projects Completed
- Government & Enterprise sectors
- Full Stack expertise

### 3. Services Section
- 3 service cards:
  - Backend Development
  - Frontend Development
  - Full Stack Solutions
- Feature lists with icons

### 4. Projects Section
- 5 featured projects with details:
  1. Press Q&A Management System
  2. House Exchange Platform
  3. Post Office Management System
  4. SHTP Website
  5. Lavictoire Mobile App
- Click to view full project details
- Tech stack chips

### 5. Skills Section
- Organized by categories:
  - Backend (.NET Core, ASP.NET MVC, EF Core, etc.)
  - Frontend (HTML/CSS/JS, jQuery, Bootstrap)
  - Database (SQL Server, MySQL)
  - Tools & Others (GitLab, IIS, Flutter, AI tools)

### 6. Experience & Education Sections
- Work at Tri Viet JSC (July 2023 - Dec 2025)
- HCMC University of Technology (2019-2023)
- GPA: 7.0/10

### 7. Footer/Contact Section
- "Let's Build Quality Products Together"
- Social links
- Download Resume button
- Copyright notice

## Customization

### Update Your Information

Edit `/Users/hieupham/Projects/hieugc/lib/data/portfolio_data.dart`

This single file contains all your content:
- Personal info (name, email, GitHub)
- Projects (add/edit/remove)
- Skills (add new technologies)
- Work experience
- Education details

### Change Colors

Edit `/Users/hieupham/Projects/hieugc/lib/config/colors.dart`

Current theme:
- Background: #1A1D29 (dark navy)
- Cards: #252834 (lighter navy)
- Accent: #FCA61F (gold)
- Text: White & gray

## Deployment

### Option 1: Firebase Hosting (Recommended)

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Update .firebaserc with your project ID
# Then build and deploy
flutter build web --release
firebase deploy
```

### Option 2: GitHub Pages

```bash
# Build with base href
flutter build web --release --base-href "/hieugc/"

# Push build/web to gh-pages branch
# Enable GitHub Pages in repository settings
```

### Option 3: Vercel

1. Push code to GitHub
2. Import repository on Vercel
3. Configure:
   - Build: `flutter build web --release`
   - Output: `build/web`
4. Deploy

## Responsive Design

Your portfolio automatically adapts to:

**Mobile (<600px):**
- Single column layout
- Hamburger menu
- Stacked sections

**Tablet (600-1200px):**
- 2-column grids
- Optimized spacing

**Desktop (>1200px):**
- Full layout with max-width 1200px
- 3-column grids for services
- Side-by-side hero section

## Testing

Test on different devices:

```bash
# Run in Chrome
flutter run -d chrome

# Test mobile view: Open DevTools > Toggle device toolbar

# Test on real device: Deploy to Firebase/Vercel and test
```

## Troubleshooting

### Flutter not found
```bash
# Add to ~/.zshrc or ~/.bash_profile
export PATH="$PATH:/path/to/flutter/bin"
```

### Dependencies error
```bash
flutter clean
flutter pub get
```

### Build errors
```bash
flutter doctor -v
# Fix any issues shown
```

### Assets not loading
Make sure assets are in the correct folders and listed in `pubspec.yaml`

## Adding New Projects

1. Open `lib/data/portfolio_data.dart`
2. Add to `projects` list:

```dart
Project(
  title: 'Your New Project',
  category: 'Web Application',
  description: 'Project description here',
  techStack: ['Tech1', 'Tech2'],
  role: 'Your Role',
  keyFeatures: [
    'Feature 1',
    'Feature 2',
  ],
),
```

3. Hot reload or rebuild

## Need Help?

Check these resources:
- Flutter Docs: https://docs.flutter.dev/
- Flutter Web: https://docs.flutter.dev/get-started/web
- Firebase Hosting: https://firebase.google.com/docs/hosting

## Summary

You now have a complete, professional portfolio website!

**To see it:**
1. Install Flutter
2. Run `flutter pub get`
3. Run `flutter run -d chrome`

Your portfolio will open in Chrome at http://localhost:XXXXX

**To deploy:**
1. Build with `flutter build web --release`
2. Deploy to Firebase/Vercel/GitHub Pages

Good luck! 🚀
