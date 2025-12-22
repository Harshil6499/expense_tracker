import 'package:flutter/material.dart';
import 'Views/Splash Screen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingDone = prefs.getBool('onboarding_done') ?? false;

  runApp(MyApp(onboardingDone: onboardingDone));
}

class MyApp extends StatelessWidget {
  final bool onboardingDone;
  const MyApp({super.key, required this.onboardingDone});

  @override
  Widget build(BuildContext context) {return MaterialApp(debugShowCheckedModeBanner: false, home: onboardingDone ? const LoginScreen() : const OnBordingScreen(),
    );
  }
}



