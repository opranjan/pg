
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/constants/constant.dart';
import 'package:pg/models/floor/floor_model.dart';
import 'package:pg/services/dio_services.dart';

class AddFloorController extends GetxController {
  RxString totalfloors = ''.obs; // Reactive variable

  // Add loading state to indicate network request
  RxBool isLoading = false.obs;

   var floorlist = <Floor>[].obs; // Observable list of properties

  @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    fetchFloors();
  }


  Future<void> fetchFloors() async {
    isLoading.value = true;
    try {
      final response = await DioServices.get(AppConstant.addFloor('1'));
      if (response.statusCode == 200) {
        floorlist.value = (response.data as List)
            .map((json) => Floor.fromJson(json))
            .toList();
            update();
      } else {
        Get.snackbar("Error", "Failed to fetch properties: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    } finally {
      isLoading.value = false;
    }
  }  

addFloor() async {
  // Check if total floors is valid
  if (totalfloors.value.isEmpty) {
    snackBar("Error", "Total floors cannot be empty");
    return;
  }

  // Try parsing the string to an integer
  final totalFloorsInt = int.tryParse(totalfloors.value);

  // Check if the parsing was successful
  if (totalFloorsInt == null) {
    snackBar("Error", "Total floors must be a valid number");
    return;
  }

  // Start loading indicator
  isLoading.value = true;

  try {
    // Make the API call, passing the parsed integer value
    final response = await DioServices.postRequest(AppConstant.addFloor('1'), {
      "total_floors": totalFloorsInt,  // Pass the integer value
    });

    // Check if the response is successful
    if (response.statusCode == 200) {
      snackBar("Success", response.data["message"]);
    } else {
      snackBar("Error", "Failed to add floor: ${response.data['message'] ?? 'Unknown error'}");
    }
  } catch (e) {
    debugPrint(e.toString());
    snackBar("Error", "An error occurred: $e");
  } finally {
    // Stop loading indicator
    isLoading.value = false;
  }
}






}
