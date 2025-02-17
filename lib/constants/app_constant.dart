class AppConstant {
  static const String baseUrl = "https://mintcream-dolphin-875931.hostingersite.com/api";
  static const String supportURL = "https://wa.me/919499888170";
  static const String buildings = "buildings";

   static const String login = "login";

  // Endpoint for adding a room to a specific floor
  // static String addRoom(String buildingNumber) => "floors/$buildingNumber/rooms";

  // Endpoint for adding a floor to a specific building
  static String addFloor(String buildingNumber) => "buildings/$buildingNumber/floors";

    // Endpoint for adding a floor to a specific building
  static String addroom(String floorNumber) => "floors/$floorNumber/rooms";
  static String tenants = "tenants";
  static String propertyreports ="property-report";
  static String dues ="dues";
  static String expanse ="expenses";
 
}
