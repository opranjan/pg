import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/duesmodel/duesmodel.dart';
import 'package:pg/services/dio_services.dart';

class DuesController extends GetxController{



    // Create TextEditingController for the fields
  var amountController = TextEditingController().obs;
  var dueDateController = TextEditingController().obs;
  var remarksController = TextEditingController().obs;



  // Add loading state to indicate network request
  RxBool isLoading = false.obs;

   var dueslist = <DuesModel>[].obs; // Observable list of properties

  @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    fetchDues();
  }


  // Fetch the floors data from the API
  Future<void> fetchDues() async {
    isLoading.value = true;
    update(); // Trigger rebuild to show the loading indicator

    try {
      final response = await DioServices.get(AppConstant.dues);
      if (response.statusCode == 200) {
        dueslist.value = (response.data as List)
            .map((json) => DuesModel.fromJson(json))
            .toList();
        update(); // Trigger rebuild with new data
      } else {
        Get.snackbar("Error", "Failed to fetch Dues: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    } finally {
      isLoading.value = false;
      update(); // Trigger rebuild to hide the loading indicator
    }
  }









  Future<void> addDuesToTenant(String tenantid) async {
  if (amountController.value!='' &&
      dueDateController.value!='' &&
      remarksController.value!='' ) {
    final newProperty = {
      "amount": amountController.value,
      "date": dueDateController.value,
      "remark": remarksController.value,
      "due_type": "deposit",
    };

    try {
      final response = await DioServices.postRequest("dues/add-to-tenant/${tenantid}", newProperty);
      if (response.statusCode == 201) {
        Get.snackbar("Success", "dues added successfully");
        await fetchDues(); // Update the list after successfully creating a property
      } else {
        Get.snackbar("Error", "Failed to add dues: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    }
  } else {
    Get.snackbar("Validation", "Please fill all fields and agree to terms");
  }
}

}