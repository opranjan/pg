import 'dart:convert';

class AddTenantModel {
  Tenant tenant;
  StayDetails stayDetails;
  PaymentDetails paymentDetails;

  AddTenantModel({
    required this.tenant,
    required this.stayDetails,
    required this.paymentDetails,
  });

  factory AddTenantModel.fromJson(Map<String, dynamic> json) {
    return AddTenantModel(
      tenant: Tenant.fromJson(json['tenant']),
      stayDetails: StayDetails.fromJson(json['stay_details']),
      paymentDetails: PaymentDetails.fromJson(json['payment_details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tenant': tenant.toJson(),
      'stay_details': stayDetails.toJson(),
      'payment_details': paymentDetails.toJson(),
    };
  }
}

class Tenant {
  String name;
  String phone;
  String altphone;
  int buildingId;
  int roomId;
  String unitType;
  String floor;
  int rent;
  String sharingType;
  int dailyStayChargesMin;
  int dailyStayChargesMax;
  bool isRoomAvailable;
  int electricityReadingLast;
  String electricityReadingDate;
  String roomPhotos;

  Tenant({
    required this.name,
    required this.phone,
    required this.altphone,
    required this.buildingId,
    required this.roomId,
    required this.unitType,
    required this.floor,
    required this.rent,
    required this.sharingType,
    required this.dailyStayChargesMin,
    required this.dailyStayChargesMax,
    required this.isRoomAvailable,
    required this.electricityReadingLast,
    required this.electricityReadingDate,
    required this.roomPhotos,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      name: json['name'],
      phone: json['phone'],
      altphone: json['altphone'],
      buildingId: json['building_id'],
      roomId: json['room_id'],
      unitType: json['unit_type'],
      floor: json['floor'],
      rent: json['rent'],
      sharingType: json['sharing_type'],
      dailyStayChargesMin: json['daily_stay_charges_min'],
      dailyStayChargesMax: json['daily_stay_charges_max'],
      isRoomAvailable: json['is_room_available'],
      electricityReadingLast: json['electricity_reading_last'],
      electricityReadingDate: json['electricity_reading_date'],
      roomPhotos: json['room_photos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'altphone': altphone,
      'building_id': buildingId,
      'room_id': roomId,
      'unit_type': unitType,
      'floor': floor,
      'rent': rent,
      'sharing_type': sharingType,
      'daily_stay_charges_min': dailyStayChargesMin,
      'daily_stay_charges_max': dailyStayChargesMax,
      'is_room_available': isRoomAvailable,
      'electricity_reading_last': electricityReadingLast,
      'electricity_reading_date': electricityReadingDate,
      'room_photos': roomPhotos,
    };
  }
}

class StayDetails {
  String building;
  String room;
  String moveIn;
  String moveOut;
  int lockInPeriod;
  int noticePeriod;
  int agreementPeriod;
  String rentalFrequency;
  int addRentOn;
  int fixedRent;
  int regularSecurityDeposit;
  String roomElectricityMeter;
  String tenantElectricityMeter;
  Map<String, dynamic> otherDetail;

  StayDetails({
    required this.building,
    required this.room,
    required this.moveIn,
    required this.moveOut,
    required this.lockInPeriod,
    required this.noticePeriod,
    required this.agreementPeriod,
    required this.rentalFrequency,
    required this.addRentOn,
    required this.fixedRent,
    required this.regularSecurityDeposit,
    required this.roomElectricityMeter,
    required this.tenantElectricityMeter,
    required this.otherDetail,
  });

  factory StayDetails.fromJson(Map<String, dynamic> json) {
    return StayDetails(
      building: json['building'],
      room: json['room'],
      moveIn: json['move_in'],
      moveOut: json['move_out'],
      lockInPeriod: json['lock_in_period'],
      noticePeriod: json['notice_period'],
      agreementPeriod: json['agreement_period'],
      rentalFrequency: json['rental_frequency'],
      addRentOn: json['add_rent_on'],
      fixedRent: json['fixed_rent'],
      regularSecurityDeposit: json['regular_security_deposit'],
      roomElectricityMeter: json['room_electricity_meter'],
      tenantElectricityMeter: json['tenant_electricity_meter'],
      otherDetail: json['other_detail'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'building': building,
      'room': room,
      'move_in': moveIn,
      'move_out': moveOut,
      'lock_in_period': lockInPeriod,
      'notice_period': noticePeriod,
      'agreement_period': agreementPeriod,
      'rental_frequency': rentalFrequency,
      'add_rent_on': addRentOn,
      'fixed_rent': fixedRent,
      'regular_security_deposit': regularSecurityDeposit,
      'room_electricity_meter': roomElectricityMeter,
      'tenant_electricity_meter': tenantElectricityMeter,
      'other_detail': otherDetail,
    };
  }
}

class PaymentDetails {
  String paymentDate;
  int amountPaid;
  String dueDate;
  int dueAmount;
  String description;

  PaymentDetails({
    required this.paymentDate,
    required this.amountPaid,
    required this.dueDate,
    required this.dueAmount,
    required this.description,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      paymentDate: json['payment_date'],
      amountPaid: json['amount_paid'],
      dueDate: json['due_date'],
      dueAmount: json['due_amount'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_date': paymentDate,
      'amount_paid': amountPaid,
      'due_date': dueDate,
      'due_amount': dueAmount,
      'description': description,
    };
  }
}
