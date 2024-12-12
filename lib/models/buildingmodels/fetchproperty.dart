class FetchProperty {
  final int id;
  final String name;
  final String ownerName;
  final String ownerPhone;
  final int pincode;
  final List<Floor> floors;
  final String createdAt;
  final String updatedAt;

  FetchProperty({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.ownerPhone,
    required this.pincode,
    required this.floors,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FetchProperty.fromJson(Map<String, dynamic> json) {
    return FetchProperty(
      id: json['id'],
      name: json['name'],
      ownerName: json['owner_name'],
      ownerPhone: json['owner_phone'],
      pincode: json['pincode'],
      floors: (json['floors'] as List).map((e) => Floor.fromJson(e)).toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owner_name': ownerName,
      'owner_phone': ownerPhone,
      'pincode': pincode,
      'floors': floors.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Floor {
  final int id;
  final int buildingId;
  final String name;
  final int floorNumber;
  final int totalRooms;
  final List<Room> rooms;
  final String createdAt;
  final String updatedAt;

  Floor({
    required this.id,
    required this.buildingId,
    required this.name,
    required this.floorNumber,
    required this.totalRooms,
    required this.rooms,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'],
      buildingId: json['building_id'],
      name: json['name'] ?? '',  // Handle null name
      floorNumber: json['floor_number'] ?? 0,  // Handle null floor_number
      totalRooms: json['total_rooms'] ?? 0,  // Handle null total_rooms
      rooms: (json['rooms'] as List).map((e) => Room.fromJson(e)).toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'building_id': buildingId,
      'name': name,
      'floor_number': floorNumber,
      'total_rooms': totalRooms,
      'rooms': rooms.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Room {
  final String name;
  final String rent;
  final String minimum;
  final String maximum;
  final int? areaSqft;  // Nullable field
  final String remarks;
  final String facilities;
  final String lastReading;
  final String date;
  final int id;
  final int floorId;
  final int capacity;
  final String price;
  final int availability;
  final String unitType;
  final String sharingType;
  final int totalRooms;
  final int? roomNumber;  // Nullable field
  final String? other;  // Nullable field
  final String createdAt;
  final String updatedAt;

  Room({
    required this.name,
    required this.rent,
    required this.minimum,
    required this.maximum,
    this.areaSqft,
    required this.remarks,
    required this.facilities,
    required this.lastReading,
    required this.date,
    required this.id,
    required this.floorId,
    required this.capacity,
    required this.price,
    required this.availability,
    required this.unitType,
    required this.sharingType,
    required this.totalRooms,
    this.roomNumber,
    this.other,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json['name'] ?? '',
      rent: json['rent'] ?? '',
      minimum: json['minimum'] ?? '',
      maximum: json['maximum'] ?? '',
      areaSqft: json['area_sqft'] as int?,  // Nullable field
      remarks: json['remarks'] ?? '',
      facilities: json['facilities'] ?? '',
      lastReading: json['last_reading'] ?? '',
      date: json['date'] ?? '',
      id: json['id'],
      floorId: json['floor_id'],
      capacity: json['capacity'] ?? 0,  // Handle null capacity
      price: json['price'] ?? '',
      availability: json['availability'] ?? 0,  // Handle null availability
      unitType: json['unit_type'] ?? '',
      sharingType: json['sharing_type'] ?? '',
      totalRooms: json['total_rooms'] ?? 0,  // Handle null total_rooms
      roomNumber: json['room_number'] as int?,  // Nullable field
      other: json['other'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rent': rent,
      'minimum': minimum,
      'maximum': maximum,
      'area_sqft': areaSqft,
      'remarks': remarks,
      'facilities': facilities,
      'last_reading': lastReading,
      'date': date,
      'id': id,
      'floor_id': floorId,
      'capacity': capacity,
      'price': price,
      'availability': availability,
      'unit_type': unitType,
      'sharing_type': sharingType,
      'total_rooms': totalRooms,
      'room_number': roomNumber,
      'other': other,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
