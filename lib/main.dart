import 'package:flutter/material.dart';

// 1. IMPORT YOUR SCREENS HERE
// Adjust the relative path depending on where your onboarding file is placed:
import 'screens/onboarding.dart'; 
import 'screens/dashboard.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WikApp Beta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDE5838), // Burnt Orange primary theme
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F4F6),
        useMaterial3: true,
      ),

      // 2. SET INITIAL SCREEN TO ONBOARDING
      home: const OnboardingScreen(),

      // 3. DEFINE APP ROUTES FOR EASY NAVIGATION
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/dashboard': (context) => const ActivityDashboardScreen(),
      },
    );
  }
}