import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            buildBackground(),
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              // Page View Builder
              children: [
                buildPage(
                  lottie: "assets/lottie/OnBording.json",
                  title: "Track Expenses",
                  subtitle: "Easily track daily expenses",
                ),
                buildPage(
                  icon: Icons.pie_chart,
                  title: "Manage Budget",
                  subtitle: "Monthly & yearly budget planning",
                ),
                buildPage(
                  icon: Icons.savings,
                  title: "Save Money",
                  subtitle: "Analyze and save money smartly",
                ),
              ],
            ),

            // Skip Button
            Positioned(
              top: 35,
              right: 10,
              child: currentIndex != 2
                  ? TextButton(
                onPressed: () {
                  navigateToLogin(context);
                },
                child: const Text(
                  "Skip >>",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
                  : const SizedBox(),
            ),

            // For Icons
            Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(4),
                    width: currentIndex == index ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
            ),

            //Next Button or Get Started
            Positioned(
              left: 20,
              right: 20,
              bottom: 30,
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == 2) {
                      // Navigate to Home/Login
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == 2 ? "Get Started >>" : "Next >",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Page View Builder Widget
  Widget buildPage({
    String? lottie,
    IconData? icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          if (lottie != null)
            Lottie.asset(
              lottie,
              height: 200,
            )
          else if (icon != null)
            Icon(
              icon,
              size: 120,
              color: Colors.blue,
            ),

          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFBBDEFE),
            Color(0xFFE3F2FD),
            Color(0xFFF1F8E9),
            Color(0xFFE8F5E1),
          ],
        ),
      ),
    );
  }


  //Shred Preferences for only 1 time OnBording Screen
  Future<void> saveOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);
  }


  //Disable back button after Skip / Get Started
  void navigateToLogin(BuildContext context) async {
    await saveOnboardingDone();

    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
          (route) => false,
    );
  }

}



