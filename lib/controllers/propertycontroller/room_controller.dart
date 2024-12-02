import 'package:get/get.dart';
import 'package:pg/models/roommodels/room_model.dart';
import 'package:pg/services/dio_services.dart';

class RoomController extends GetxController {
  // Fields
  String? unitType;
  String? floor;
  String? sharingType;
  String? isAvailable = "Yes";
  DateTime? selectedDate;
  var isLoading = false.obs; // Loading state for API calls
   var rooms = <RoomModel>[].obs; // Observable list of properties



  Map<String, bool> facilities = {
    'WiFi': false,
    'AC': false,
    'TV': false,
    'Parking': false,
    'Laundry': false,
  };

  void setUnitType(String value) {
    unitType = value;
    update();
  }

  void setFloor(String value) {
    floor = value;
    update();
  }

  void setSharingType(String value) {
    sharingType = value;
    update();
  }

  void setAvailability(String value) {
    isAvailable = value;
    update();
  }

  void toggleFacility(String key, bool value) {
    facilities[key] = value;
    update();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    update();
  }


  //fetch rooms 

    @override
  void onInit() {
    super.onInit();
    fetchRooms();
  }

  // Fetch properties from the server
  Future<void> fetchRooms() async {
    isLoading.value = true;
    try {
      final response = await DioServices.get("buildings/6");
      if (response.statusCode == 200) {
        rooms.value = (response.data['rooms'] as List)
            .map((json) => RoomModel.fromJson(json))
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

  
}