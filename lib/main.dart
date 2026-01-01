import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ViewModels
import 'ViewModels/LogIn_ViewModel.dart';
import 'ViewModels/User/User_ViewModel.dart';
import 'ViewModels/Admin/Admin_User_ViewModel.dart';

// Screens
import 'Views/Access/Login_Screen.dart';
import 'Views/Splash Screen/SplashScreen.dart';
import 'Views/User/View_Profile.dart';
import 'Views/Admin/Admin_User_View.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
  final String userRole = prefs.getString('user_role') ?? '';

  runApp(
    MyApp(
      onboardingDone: onboardingDone,
      isLoggedIn: isLoggedIn,
      userRole: userRole,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool onboardingDone;
  final bool isLoggedIn;
  final String userRole;

  const MyApp({
    super.key,
    required this.onboardingDone,
    required this.isLoggedIn,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => AdminUserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: _getStartScreen(),
        routes: {
          '/login': (_) => const LoginScreen(),
          //'/userHome': (_) => const ViewUser(),
          '/adminHome': (_) => const AdminUserListScreen(),
          '/profile': (_) => const UserProfileScreen(),
        },
      ),
    );
  }

  Widget _getStartScreen() {
    if (!onboardingDone) {
      return const OnBordingScreen(); // First time only
    }

    if (!isLoggedIn) {
      return const LoginScreen();
    }

    if (userRole == 'admin') {
      return const AdminUserListScreen();
    }

    return const UserProfileScreen();
  }
}
