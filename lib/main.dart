import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ViewModels/User/User_ViewModel.dart';
import 'Views/Admin/Admin_User_View.dart';
import 'Views/Splash Screen/SplashScreen.dart';
import 'Views/User/View_Profile.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime =
      prefs.getBool('is_first_time') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        // add AdminViewModel here later if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isFirstTime
            ? const OnBordingScreen()
            : const AdminUserListScreen(),
      ),
    );
  }
}
