
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


  // Fetch the floors data from the API
  Future<void> fetchFloors() async {
    isLoading.value = true;
    update(); // Trigger rebuild to show the loading indicator

    try {
      final response = await DioServices.get(AppConstant.addFloor('1'));
      if (response.statusCode == 200) {
        floorlist.value = (response.data as List)
            .map((json) => Floor.fromJson(json))
            .toList();
        update(); // Trigger rebuild with new data
      } else {
        Get.snackbar("Error", "Failed to fetch floors: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    } finally {
      isLoading.value = false;
      update(); // Trigger rebuild to hide the loading indicator
    }
  }




addFloor() async {
  if (totalfloors.value.isEmpty) {
    snackBar("Error", "Total floors cannot be empty");
    return;
  }

  final totalFloorsInt = int.tryParse(totalfloors.value);
  if (totalFloorsInt == null) {
    snackBar("Error", "Total floors must be a valid number");
    return;
  }

  isLoading.value = true;

  try {
    final response = await DioServices.postRequest(AppConstant.addFloor('1'), {
      "total_floors": totalFloorsInt,
    });

    if (response.statusCode == 200) {
      snackBar("Success", response.data["message"]);
      // Optionally, fetch updated floor data after adding a new floor
      fetchFloors();
    } else {
      snackBar("Error", "Failed to add floor: ${response.data['message'] ?? 'Unknown error'}");
    }
  } catch (e) {
    debugPrint(e.toString());
    snackBar("Error", "An error occurred: $e");
  } finally {
    isLoading.value = false;
  }
}

}

