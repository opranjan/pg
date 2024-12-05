class AddTenant {
    AddTenant({
        required this.name,
        required this.phone,
        required this.altphone,
        required this.buildingId,
        required this.roomId,
        required this.unitType,
        required this.floor,
        required this.sharingType,
        required this.dailyStayChargesMin,
        required this.dailyStayChargesMax,
        required this.isRoomAvailable,
        required this.electricityReadingLast,
        required this.electricityReadingDate,
        required this.roomPhotos,
    });

    final String? name;
    final String? phone;
    final String? altphone;
    final int? buildingId;
    final int? roomId;
    final String? unitType;
    final String? floor;
    final String? sharingType;
    final int? dailyStayChargesMin;
    final int? dailyStayChargesMax;
    final bool? isRoomAvailable;
    final double? electricityReadingLast;
    final DateTime? electricityReadingDate;
    final String? roomPhotos;

    factory AddTenant.fromJson(Map<String, dynamic> json){ 
        return AddTenant(
            name: json["name"],
            phone: json["phone"],
            altphone: json["altphone"],
            buildingId: json["building_id"],
            roomId: json["room_id"],
            unitType: json["unit_type"],
            floor: json["floor"],
            sharingType: json["sharing_type"],
            dailyStayChargesMin: json["daily_stay_charges_min"],
            dailyStayChargesMax: json["daily_stay_charges_max"],
            isRoomAvailable: json["is_room_available"],
            electricityReadingLast: json["electricity_reading_last"],
            electricityReadingDate: DateTime.tryParse(json["electricity_reading_date"] ?? ""),
            roomPhotos: json["room_photos"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "altphone": altphone,
        "building_id": buildingId,
        "room_id": roomId,
        "unit_type": unitType,
        "floor": floor,
        "sharing_type": sharingType,
        "daily_stay_charges_min": dailyStayChargesMin,
        "daily_stay_charges_max": dailyStayChargesMax,
        "is_room_available": isRoomAvailable,
        "electricity_reading_last": electricityReadingLast,
        "electricity_reading_date": electricityReadingDate,
        "room_photos": roomPhotos,
    };

}
