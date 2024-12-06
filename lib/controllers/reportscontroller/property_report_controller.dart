import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/reports/propertyreport.dart';
import 'package:pg/services/dio_services.dart';



class PropertyReportController extends GetxController{
  var isLoading = false.obs; // Loading state for API calls
   var propertyreports = <PropertyReport>[].obs; // Observable list of properties


 //fetch rooms 

    @override
  void onInit() {
    super.onInit();
    fetchPropertiesReport();
  }
 


  // Fetch properties from the server
  Future<void> fetchPropertiesReport() async {
    isLoading.value = true;
    try {
      final response = await DioServices.get(AppConstant.propertyreports);
      if (response.statusCode == 200) {
        propertyreports.value = (response.data as List)
            .map((json) => PropertyReport.fromJson(json))
            .toList();
            update();
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