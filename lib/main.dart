import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pg/constants/constant.dart';
import 'package:pg/controllers/theme_controller.dart';
import 'package:pg/theme/dark_theme.dart';
import 'package:pg/theme/light_theme.dart';
import 'package:pg/views/pages/Login/login_page.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (c) {
      return GetMaterialApp(
        title: 'Dolphin Pg',
        debugShowCheckedModeBanner: false,
        theme: c.lightTheme ? dark : light,
        home: const SplashScreen(),
      );
    });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkToken();
  }

  Future<void> _checkToken() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: bgImageDecor,
        child: Center(
          child: Lottie.asset(
            'assets/Animation/splashScreen.json',
            repeat: false,
          ),
        ),
      ),
    );
  }
}
