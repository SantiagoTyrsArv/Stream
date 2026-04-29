import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../event_creator/presentation/pages/event_creator_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Hold the splash screen for 2.5 seconds
    await Future.delayed(const Duration(milliseconds: 2500));
    
    if (mounted) {
      // Smooth fade transition to the main app
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) => const EventCreatorPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.event_available_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
            .animate()
            .scale(duration: 600.ms, curve: Curves.easeOutBack)
            .fadeIn(duration: 600.ms),

            const SizedBox(height: 24),
            
            // App Title
            Text(
              'Event Creator',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: 1.2,
              ),
            )
            .animate(delay: 300.ms)
            .slideY(begin: 0.3, end: 0, duration: 500.ms, curve: Curves.easeOutQuad)
            .fadeIn(duration: 500.ms),

            const SizedBox(height: 12),

            // Subtitle
            Text(
              'Design your perfect event',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                letterSpacing: 0.5,
              ),
            )
            .animate(delay: 500.ms)
            .fadeIn(duration: 500.ms),
          ],
        ),
      ),
    );
  }
}
