import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pg/models/buildingmodels/property.dart';
import 'package:pg/services/dio_services.dart';

class PropertyFormController extends GetxController {
  // TextEditingController for each form field
  TextEditingController propertyName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController ownerPhone = TextEditingController();
  TextEditingController propertyPincode = TextEditingController();

  var isChecked = false.obs; // Checkbox state
  var isLoading = false.obs; // Loading state for API calls
  var properties = <Property>[].obs; // Observable list of properties

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  // Fetch properties from the server
  Future<void> fetchProperties() async {
    isLoading.value = true;
    try {
      final response = await DioServices.get("buildings");
      if (response.statusCode == 200) {
        properties.value = (response.data as List)
            .map((json) => Property.fromJson(json))
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

Future<void> createProperty() async {
  if (propertyName.text.isNotEmpty &&
      ownerName.text.isNotEmpty &&
      ownerPhone.text.isNotEmpty &&
      propertyPincode.text.isNotEmpty &&
      isChecked.value) {
    final newProperty = {
      "name": propertyName.text,
      "ownerName": ownerName.text,
      "ownerPhone": ownerPhone.text,
      "pincode": propertyPincode.text,
    };

    try {
      final response = await DioServices.postRequest("buildings", newProperty);
      if (response.statusCode == 201) {
        Get.snackbar("Success", "Property created successfully");
        clearForm();
        await fetchProperties(); // Update the list after successfully creating a property
      } else {
        Get.snackbar("Error", "Failed to create property: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    }
  } else {
    Get.snackbar("Validation", "Please fill all fields and agree to terms");
  }
}


  // Update an existing property
  // Future<void> updateProperty(int id, Property updatedProperty) async {
  //   try {
  //     final response = await DioServices.put("buildings/$id", data: updatedProperty.toJson());
  //     if (response.statusCode == 200) {
  //       final index = properties.indexWhere((prop) => prop.id == id);
  //       if (index != -1) {
  //         properties[index] = Property.fromJson(response.data);
  //         Get.snackbar("Success", "Property updated successfully");
  //       }
  //     } else {
  //       Get.snackbar("Error", "Failed to update property: ${response.statusCode}");
  //     }
  //   } catch (error) {
  //     Get.snackbar("Exception", "Something went wrong: $error");
  //   }
  // }

  // Delete a property
  Future<void> deleteProperty(int id) async {
    try {
      final response = await DioServices.delete("buildings/$id");
      if (response.statusCode == 200) {
        properties.removeWhere((prop) => prop.id == id);
        Get.snackbar("Success", "Property deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete property: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    }
  }

  // Clear the form after submission
  void clearForm() {
    propertyName.clear();
    ownerName.clear();
    ownerPhone.clear();
    propertyPincode.clear();
    isChecked.value = false;
  }
}
