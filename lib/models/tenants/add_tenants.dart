class AddTenant {
  String? name;
  String? phone;
  String? altphone;
  int? buildingId;
  int? roomId;
  String? unitType;
  String? floor;
  String? sharingType;
  int? dailyStayChargesMin;
  int? dailyStayChargesMax;
  bool? isRoomAvailable;
  double? electricityReadingLast;
  String? electricityReadingDate;
  String? roomPhotos;

  AddTenant(
      {this.name,
      this.phone,
      this.altphone,
      this.buildingId,
      this.roomId,
      this.unitType,
      this.floor,
      this.sharingType,
      this.dailyStayChargesMin,
      this.dailyStayChargesMax,
      this.isRoomAvailable,
      this.electricityReadingLast,
      this.electricityReadingDate,
      this.roomPhotos});

  AddTenant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    altphone = json['altphone'];
    buildingId = json['building_id'];
    roomId = json['room_id'];
    unitType = json['unit_type'];
    floor = json['floor'];
    sharingType = json['sharing_type'];
    dailyStayChargesMin = json['daily_stay_charges_min'];
    dailyStayChargesMax = json['daily_stay_charges_max'];
    isRoomAvailable = json['is_room_available'];
    electricityReadingLast = json['electricity_reading_last'];
    electricityReadingDate = json['electricity_reading_date'];
    roomPhotos = json['room_photos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['altphone'] = this.altphone;
    data['building_id'] = this.buildingId;
    data['room_id'] = this.roomId;
    data['unit_type'] = this.unitType;
    data['floor'] = this.floor;
    data['sharing_type'] = this.sharingType;
    data['daily_stay_charges_min'] = this.dailyStayChargesMin;
    data['daily_stay_charges_max'] = this.dailyStayChargesMax;
    data['is_room_available'] = this.isRoomAvailable;
    data['electricity_reading_last'] = this.electricityReadingLast;
    data['electricity_reading_date'] = this.electricityReadingDate;
    data['room_photos'] = this.roomPhotos;
    return data;
  }
}
