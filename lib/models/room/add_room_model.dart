class AddRoom {
  String name;
  int capacity;
  double price;
  bool availability;
  String unitType;
  String sharingType;
  double rent;
  double maximum;
  double minimum;
  double areaSqft;
  String remarks;
  List<String> facilities;
  double lastReading;
  String date;
  List<String> other;

  // Constructor
  AddRoom({
    required this.name,
    required this.capacity,
    required this.price,
    required this.availability,
    required this.unitType,
    required this.sharingType,
    required this.rent,
    required this.maximum,
    required this.minimum,
    required this.areaSqft,
    required this.remarks,
    required this.facilities,
    required this.lastReading,
    required this.date,
    required this.other,
  });

  // Factory method to create a AddRoom instance from JSON
  factory AddRoom.fromJson(Map<String, dynamic> json) {
    return AddRoom(
      name: json['name'],
      capacity: json['capacity'],
      price: json['price'].toDouble(),
      availability: json['availability'],
      unitType: json['unit_type'],
      sharingType: json['sharing_type'],
      rent: json['rent'].toDouble(),
      maximum: json['maximum'].toDouble(),
      minimum: json['minimum'].toDouble(),
      areaSqft: json['area_sqft'].toDouble(),
      remarks: json['remarks'],
      facilities: List<String>.from(json['facilities']),
      lastReading: json['last_reading'].toDouble(),
      date: json['date'],
      other: List<String>.from(json['other']),
    );
  }

  // Method to convert AddRoom instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capacity': capacity,
      'price': price,
      'availability': availability,
      'unit_type': unitType,
      'sharing_type': sharingType,
      'rent': rent,
      'maximum': maximum,
      'minimum': minimum,
      'area_sqft': areaSqft,
      'remarks': remarks,
      'facilities': facilities,
      'last_reading': lastReading,
      'date': date,
      'other': other,
    };
  }
}
