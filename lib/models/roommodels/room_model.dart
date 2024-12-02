class RoomModel {
  int? id;
  int? floorId;
  int? capacity;
  String? price;
  int? availability;
  String? unitType;
  String? sharingType;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? laravelThroughKey;

  RoomModel({
    this.id,
    this.floorId,
    this.capacity,
    this.price,
    this.availability,
    this.unitType,
    this.sharingType,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.laravelThroughKey,
  });

  // Factory method to create an instance from JSON
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'],
      floorId: json['floor_id'],
      capacity: json['capacity'],
      price: json['price'],
      availability: json['availability'],
      unitType: json['unit_type'],
      sharingType: json['sharing_type'],
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      laravelThroughKey: json['laravel_through_key'],
    );
  }

  // Method to convert an instance into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'floor_id': floorId,
      'capacity': capacity,
      'price': price,
      'availability': availability,
      'unit_type': unitType,
      'sharing_type': sharingType,
      'deleted_at': deletedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'laravel_through_key': laravelThroughKey,
    };
  }
}
