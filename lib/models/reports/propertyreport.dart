class PropertyReport {
  int? totalProperties;
  int? totalRooms;

  PropertyReport({this.totalProperties, this.totalRooms});

  PropertyReport.fromJson(Map<String, dynamic> json) {
    totalProperties = json['total_properties'];
    totalRooms = json['total_rooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_properties'] = this.totalProperties;
    data['total_rooms'] = this.totalRooms;
    return data;
  }
}
