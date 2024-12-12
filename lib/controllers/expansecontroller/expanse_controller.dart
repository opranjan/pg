import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/expanse/expanse_model.dart';
import 'package:pg/services/dio_services.dart';

class ExpanseController extends GetxController{


  // Add loading state to indicate network request
  RxBool isLoading = false.obs;

   var expanselist = <ExpenseModel>[].obs; // Observable list of properties

  @override
  void onInit() {
    super.onInit();
    // Fetch floors when the controller is initialized
    fetchExpanses();
  }


  // Fetch the floors data from the API
  Future<void> fetchExpanses() async {
    isLoading.value = true;
    update(); // Trigger rebuild to show the loading indicator

    try {
      final response = await DioServices.get(AppConstant.expanse);
      if (response.statusCode == 200) {
        expanselist.value = (response.data as List)
            .map((json) => ExpenseModel.fromJson(json))
            .toList();
        update(); // Trigger rebuild with new data
      } else {
        Get.snackbar("Error", "Failed to fetch Expanses: ${response.statusCode}");
      }
    } catch (error) {
      Get.snackbar("Exception", "Something went wrong: $error");
    } finally {
      isLoading.value = false;
      update(); // Trigger rebuild to hide the loading indicator
    }
  }

}