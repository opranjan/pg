import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/reports/propertyreport.dart';
import 'package:pg/services/dio_services.dart';



class PropertyReportController extends GetxController{
  var isLoading = false.obs; // Loading state for API calls
   var propertyreports = <PropertyReport>[].obs;
   var  totalRooms = "".obs;
   var totalProperties = "".obs;


 //fetch rooms 

    @override
  void onInit() {
    super.onInit();
    fetchPropertiesReport();
  }
 


 Future<void> fetchPropertiesReport() async {
  isLoading.value = true;
  try {
    final response = await DioServices.get(AppConstant.propertyreports);
    if (response.statusCode == 200) {
      // Use assignAll to update the observable list
      totalRooms.value = response.data['total_rooms'];
      totalProperties = response.data['total_properties'];
      // propertyreports.assignAll(
      //   (response.data).map((json) => PropertyReport.fromJson(json)).toList(),
      // );
      update();

      print("HHHHHHHHHHHHHHH: $propertyreports");
    } else {
      Get.snackbar("Error", "Failed to fetch properties reports: ${response.statusCode}");
    }
  } catch (error) {
    Get.snackbar("Exception", "Something went wrong: $error");
  } finally {
    isLoading.value = false;
  }
}


}