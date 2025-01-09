import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/buildingmodels/fetchproperty.dart';
import 'package:pg/services/dio_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyFormController extends GetxController {
  // TextEditingController for each form field
  TextEditingController propertyName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController ownerPhone = TextEditingController();
  TextEditingController propertyPincode = TextEditingController();

  var isChecked = false.obs; // Checkbox state
  var isLoading = false.obs; // Loading state for API calls
  //  var properties = <Property>[].obs; // Observable list of properties
    var properties = <FetchProperty>[].obs; // Observable list of properties
    var propertyNameObs = Rx<String?>(null); // Observable property name
    // var propertylist = <FetchProperty>[].obs;

    var totalPropertiesReports =0.obs;
    var totalRoomsReports =0.obs;

  

  @override
  void onInit() async{
    super.onInit();
     await fetchProperties();
    await loadPropertyName(); // Load the stored property name

  }


  // Method to fetch the stored property name from SharedPreferences
  Future<void> loadPropertyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('selected_property_name');
    propertyNameObs.value = storedName; // Update the observable property name

    update();
    print("hhhhhhhhhhhhhh: ${propertyNameObs.value}");
  }

  // Method to save the updated property name to SharedPreferences
  Future<void> updatePropertyName(String newName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_property_name', newName); // Save updated name
    propertyNameObs.value = newName; // Update the observable property name
  }

 

  // Fetch properties from the server
  Future<void> fetchProperties() async {
    isLoading.value = true;  // Indicate that loading has started

    try {
      final response = await DioServices.get("buildings");  // Replace with your actual API endpoint
      if (response.statusCode == 200) {
        // Map the response to FetchProperty objects
        properties.value = (response.data as List)
            .map((json) => FetchProperty.fromJson(json))
            .toList();

        update();  // Update the UI after data is fetched
      } else {
        // Handle the case when the status code is not 200
        Get.snackbar("Error", "Failed to fetch properties: ${response.statusCode}");
      }
    } catch (error) {
      print("Something went wrong: $error");
      // Display error message to the user
      Get.snackbar("Exception", "Something went wrong: $error");
    } finally {
      // End the loading state regardless of success or failure
      isLoading.value = false;
    }
  }



    // Fetch properties from the server
  Future<void> propertiesReports() async {
  

    try {
      final response = await DioServices.get(AppConstant.propertyreports);  // Replace with your actual API endpoint
      if (response.statusCode == 200) {
       totalPropertiesReports.value = response.data['total_properties'];
       totalRoomsReports.value = response.data['total_rooms'];

       print("dfjdfjdfk :");
        update();  // Update the UI after data is fetched
      } else {
        // Handle the case when the status code is not 200
        Get.snackbar("Error", "Failed to fetch properties: ${response.statusCode}");
      }
    } catch (error) {
      print("Something went wrong: $error");
      // Display error message to the user
      Get.snackbar("Exception", "Something went wrong: $error");
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
      "owner_name": ownerName.text,
      "owner_phone": ownerPhone.text,
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
