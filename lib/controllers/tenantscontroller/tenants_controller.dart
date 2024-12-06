import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/tenants/add_tenants.dart';
import 'package:pg/models/tenants/fetch_tenant.dart';
import 'package:pg/services/dio_services.dart';

class AddTenantsController extends GetxController {

  // Add loading state to indicate network request
  RxBool isLoading = false.obs;

   var tenantlist = <TenantModel>[].obs; // Observable list of properties




   //
     // Reactive variables to hold form data
  var tenantName = ''.obs;
  var tenantPhone = ''.obs;
   var tenantAltPhone = ''.obs;
  var selectedFloor = 1.obs;
  var selectedRoom = 1.obs;
  var rent = 0.0.obs;
  var securityDeposit = 0.0.obs;

  // For validation (optional)
  RxBool isFormValid = false.obs;



    @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    fetchTenants();
  }





    // Fetch the floors data from the API
  Future<void> fetchTenants() async {
    isLoading.value = true;
    update(); // Trigger rebuild to show the loading indicator

    try {
      final response = await DioServices.get(AppConstant.tenants);
      if (response.statusCode == 200) {
        tenantlist.value = (response.data as List)
            .map((json) => TenantModel.fromJson(json))
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





  //////////////////////////////
    // Update form validity based on values
  void updateFormValidity() {
    isFormValid.value = tenantName.value.isNotEmpty &&
        tenantPhone.value.isNotEmpty &&
        rent.value > 0 &&
        securityDeposit.value > 0;

    update();  // This will trigger GetBuilder to rebuild the UI
  }

  // Setters for fields
  void setTenantName(String name) {
    tenantName.value = name;
    updateFormValidity();
  }

  void setTenantPhone(String phone) {
    tenantPhone.value = phone;
    updateFormValidity();
  }


    void setTenantAltPhone(String phone) {
    tenantAltPhone.value = phone;
    updateFormValidity();
  }

  void setFloor(int floor) {
    selectedFloor.value = floor;
    updateFormValidity();
  }

  void setRoom(int room) {
    selectedRoom.value = room;
    updateFormValidity();
  }

  void setRent(double rentValue) {
    rent.value = rentValue;
    updateFormValidity();
  }

  void setSecurityDeposit(double deposit) {
    securityDeposit.value = deposit;
    updateFormValidity();
  }

  /////////////////////////////




    Future<void> createTenant(AddTenant tenant) async {
    try {
      print("started ..");
        final response =
            await DioServices.postRequest(AppConstant.tenants, tenant.toJson());
             print(response.statusCode);
        if (response.statusCode == 201) {
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