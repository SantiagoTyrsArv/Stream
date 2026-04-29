import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/event_creator/presentation/pages/event_creator_page.dart';

/// Raíz de la aplicación. Solo configura MaterialApp y delega la navegación.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Creator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const EventCreatorPage(),
    );
  }
}

