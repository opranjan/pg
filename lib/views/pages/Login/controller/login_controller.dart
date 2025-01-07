import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pg/views/bottomnav_withcurve.dart';
import 'package:pg/services/dio_services.dart';
import 'package:pg/constants/app_constant.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check login status on controller initialization
  }

  // Check if the user is already logged in
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token != null && token.isNotEmpty) {
      // Token exists, navigate to BottomNav
      Get.snackbar("Login", "LoginSuccess");
      Get.off(() => BottomNavBar());
    }
  }

  // Login function
  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter both email and password.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Prepare the request payload
      final credentials = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      };

      // Make the API call
      final response = await DioServices.postRequest(AppConstant.login, credentials);

      if (response.statusCode == 200) {
        // Handle successful login
        String token = response.data["token"];
        await saveToken(token); // Save the token in SharedPreferences

        Get.snackbar(
          "Success",
          "Login successful!",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to BottomNavBar
        Get.off(() => BottomNavBar());
      } else {
        // Handle error response
        Get.snackbar(
          "Error",
          response.data["message"] ?? "Login failed. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      // Handle exceptions
      Get.snackbar(
        "Exception",
        "Something went wrong: $error",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Save token in SharedPreferences
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
}
