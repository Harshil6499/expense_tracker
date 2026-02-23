import 'package:expense_tracker/Views/Access/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const LoginScreen()),
                  (route) => false,
            );
          },
          child: const Text("Logout"),
        ),

      ),
    );
  }
}
