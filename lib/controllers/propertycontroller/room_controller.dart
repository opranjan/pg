import 'package:get/get.dart';
import 'package:pg/constants/app_constant.dart';
import 'package:pg/models/room/add_room_model.dart';
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
      final response = await DioServices.get("floors/1/rooms");
      if (response.statusCode == 200) {
        rooms.value = (response.data as List)
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





    Future<void> createRoom(AddRoom room) async {
    try {
      
        final response =
            await DioServices.postRequest(AppConstant.addroom('1'), room.toJson());

        if (response.statusCode == 200) {
          Get.snackbar("Success", "User Added successfully",
              snackPosition: SnackPosition.BOTTOM);
          // Get.to(() => StaffSettings());
          fetchRooms();
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