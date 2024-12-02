class AppConstant {
  static const String baseUrl = "https://mintcream-dolphin-875931.hostingersite.com/api";
  static const String supportURL = "https://wa.me/919499888170";
  static const String buildings = "buildings";

  // Endpoint for adding a room to a specific floor
  static String addRoom(String buildingNumber) => "floors/$buildingNumber/rooms";

  // Endpoint for adding a floor to a specific building
  static String addFloor(String buildingNumber) => "buildings/$buildingNumber/floors";
}
