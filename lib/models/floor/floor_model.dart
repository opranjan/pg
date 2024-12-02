
class Floor {
  final int id;
  final int buildingId;
  final String name;
  final int floorNumber;
  final int totalRooms;
  final DateTime createdAt;
  final DateTime updatedAt;

  Floor({
    required this.id,
    required this.buildingId,
    required this.name,
    required this.floorNumber,
    required this.totalRooms,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a Floor object from a JSON map
  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'],
      buildingId: json['building_id'],
      name: json['name'] ?? '', // Default to empty string if null
      floorNumber: json['floor_number'],
      totalRooms: json['total_rooms'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a Floor object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'building_id': buildingId,
      'name': name,
      'floor_number': floorNumber,
      'total_rooms': totalRooms,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
