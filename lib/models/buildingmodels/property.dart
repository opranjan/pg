class Property {
  final int id;
  final String name;
  final String? ownerName;
  final String? ownerPhone;
  final int? pincode;
  final String? address;
  final String createdAt;
  final String updatedAt;

  Property({
    required this.id,
    required this.name,
    this.ownerName,
    this.ownerPhone,
    this.pincode,
    this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      ownerName: json['owner_name'],
      ownerPhone: json['owner_phone'],
      pincode: json['pincode'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
