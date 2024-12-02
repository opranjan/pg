// login_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pg/views/bottomnav_withcurve.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please enter both email and password.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.off(() => BottomNavBar());  // Navigate to BottomNav page
    });
  }
}
