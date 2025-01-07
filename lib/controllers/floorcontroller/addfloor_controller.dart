
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/constants/constant.dart';
import 'package:pg/models/floor/floor_model.dart';
import 'package:pg/services/dio_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFloorController extends GetxController {
  RxString totalfloors = ''.obs; // Reactive variable
  RxString currentFloorID = ''.obs;

  // Add loading state to indicate network request
  RxBool isLoading = false.obs;

   var floorlist = <Floor>[].obs; // Observable list of properties

  @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    fetchFloors();
  }


  // // Fetch the floors data from the API
  // Future<void> fetchFloors() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //    String? storedPropertyId = prefs.getString('selected_property_id');
  //   isLoading.value = true;
  //   update(); // Trigger rebuild to show the loading indicator

  //   try {
  //     final response = await DioServices.get(AppConstant.addFloor(storedPropertyId.toString()));
  //     if (response.statusCode == 200) {
  //       floorlist.value = (response.data as List)
  //           .map((json) => Floor.fromJson(json))
  //           .toList();

  //           currentFloorID.value = floorlist[0].id as String;

  //       update(); 



  //     } else {
  //       Get.snackbar("Error", "Failed to fetch floors: ${response.statusCode}");
  //     }
  //   } catch (error) {
  //     Get.snackbar("Exception", "Something went wrong: $error");
  //   } finally {
  //     isLoading.value = false;
  //     update(); // Trigger rebuild to hide the loading indicator
  //   }
  // }



  Future<void> fetchFloors() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedPropertyId = prefs.getString('selected_property_id');
  isLoading.value = true;
  update(); // Trigger rebuild to show the loading indicator

  try {
    final response = await DioServices.get(AppConstant.addFloor(storedPropertyId.toString()));
    if (response.statusCode == 200) {
      floorlist.value = (response.data as List)
          .map((json) => Floor.fromJson(json))
          .toList();

      // Ensure the list is not empty and get the ID of the 0th floor
      if (floorlist.isNotEmpty) {
        currentFloorID.value = floorlist[0].id.toString(); // Ensure 'id' is a string
      }

      update(); // Update the UI

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String? storedPropertyId = prefs.getString('selected_property_id');
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
    final response = await DioServices.postRequest(AppConstant.addFloor(storedPropertyId.toString()), {
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

