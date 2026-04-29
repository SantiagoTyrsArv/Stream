import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/settings_controller.dart';
import 'features/event_creator/presentation/pages/event_creator_page.dart';

/// Raíz de la aplicación.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: SettingsController(),
      builder: (context, _) {
        return MaterialApp(
          title: 'Event Creator',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: SettingsController().themeMode,
          home: const EventCreatorPage(),
        );
      },
    );
  }
}

