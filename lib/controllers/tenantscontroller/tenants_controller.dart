import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/tenants/add_tenants.dart';
import 'package:pg/services/dio_services.dart';

class AddTenantsController extends GetxController {

  // Add loading state to indicate network request
  RxBool isLoading = false.obs;



    @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    // fetchFloors();
  }




    Future<void> createTenant(AddTenant tenant) async {
    try {
      print("started ..");
        final response =
            await DioServices.postRequest(AppConstant.addTenant, tenant.toJson());
             print(response.statusCode);
        if (response.statusCode == 200) {
          Get.snackbar("Success", "Teanat Added successfully",
              snackPosition: SnackPosition.BOTTOM);
          // Get.to(() => StaffSettings());
          // fetchRooms();
        } else {
          Map<String, dynamic> responseData = response.data;
          Get.snackbar("Error", "${responseData['error']}",
              snackPosition: SnackPosition.BOTTOM);
        }
     
    } catch (error) {
      Get.snackbar("Error", "Error occured ",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


}