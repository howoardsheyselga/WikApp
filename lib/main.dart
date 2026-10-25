import 'package:flutter/material.dart';
import 'package:wikapp_beta/splash.dart';
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
          seedColor: const Color(0xFFDE5838),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F4F6),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/dashboard': (context) => const ActivityDashboardScreen(),
      },
    );
  }
}