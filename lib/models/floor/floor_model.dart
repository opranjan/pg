class Floor {
  final int id;
  final int floorNo;
  final int totalRoom;

  // Constructor
  Floor({
    required this.id,
    required this.floorNo,
    required this.totalRoom,
  });

  // From JSON factory constructor
  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'] ?? 0, // Default value 0 if 'id' is null
      floorNo: json['floor_no'] ?? 0, // Default value 0 if 'floor_no' is null
      totalRoom: json['total_room'] ?? 0, // Default value 0 if 'total_room' is null
    );
  }
}
