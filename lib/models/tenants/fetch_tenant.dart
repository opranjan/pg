class TenantModel {
  int? id;
  String? name;
  String? phone;
  String? altphone;
  int? buildingId;
  String? createdAt;
  String? updatedAt;
  List<StayDetails>? stayDetails;
  List<PaymentDetails>? paymentDetails;

  TenantModel(
      {this.id,
      this.name,
      this.phone,
      this.altphone,
      this.createdAt,
      this.buildingId,
      this.updatedAt,
      this.stayDetails,
      this.paymentDetails});

  TenantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    altphone = json['altphone'];
    buildingId=json['building_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['stay_details'] != null) {
      stayDetails = <StayDetails>[];
      json['stay_details'].forEach((v) {
        stayDetails!.add(new StayDetails.fromJson(v));
      });
    }
    if (json['payment_details'] != null) {
      paymentDetails = <PaymentDetails>[];
      json['payment_details'].forEach((v) {
        paymentDetails!.add(new PaymentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['altphone'] = this.altphone;
    data['building_id'] = this.buildingId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stayDetails != null) {
      data['stay_details'] = this.stayDetails!.map((v) => v.toJson()).toList();
    }
    if (this.paymentDetails != null) {
      data['payment_details'] =
          this.paymentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StayDetails {
  int? id;
  int? tenantId;
  String? building;
  String? room;
  String? moveIn;
  String? moveOut;
  int? lockInPeriod;
  int? noticePeriod;
  int? agreementPeriod;
  String? rentalFrequency;
  int? addRentOn;
  int? fixedRent;
  int? regularSecurityDeposit;
  String? roomElectricityMeter;
  String? tenantElectricityMeter;
  Null? otherDetails;
  Null? paymentDetails;
  String? createdAt;
  String? updatedAt;

  StayDetails(
      {this.id,
      this.tenantId,
      this.building,
      this.room,
      this.moveIn,
      this.moveOut,
      this.lockInPeriod,
      this.noticePeriod,
      this.agreementPeriod,
      this.rentalFrequency,
      this.addRentOn,
      this.fixedRent,
      this.regularSecurityDeposit,
      this.roomElectricityMeter,
      this.tenantElectricityMeter,
      this.otherDetails,
      this.paymentDetails,
      this.createdAt,
      this.updatedAt});

  StayDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    building = json['building'];
    room = json['room'];
    moveIn = json['move_in'];
    moveOut = json['move_out'];
    lockInPeriod = json['lock_in_period'];
    noticePeriod = json['notice_period'];
    agreementPeriod = json['agreement_period'];
    rentalFrequency = json['rental_frequency'];
    addRentOn = json['add_rent_on'];
    fixedRent = json['fixed_rent'];
    regularSecurityDeposit = json['regular_security_deposit'];
    roomElectricityMeter = json['room_electricity_meter'];
    tenantElectricityMeter = json['tenant_electricity_meter'];
    otherDetails = json['other_details'];
    paymentDetails = json['payment_details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['building'] = this.building;
    data['room'] = this.room;
    data['move_in'] = this.moveIn;
    data['move_out'] = this.moveOut;
    data['lock_in_period'] = this.lockInPeriod;
    data['notice_period'] = this.noticePeriod;
    data['agreement_period'] = this.agreementPeriod;
    data['rental_frequency'] = this.rentalFrequency;
    data['add_rent_on'] = this.addRentOn;
    data['fixed_rent'] = this.fixedRent;
    data['regular_security_deposit'] = this.regularSecurityDeposit;
    data['room_electricity_meter'] = this.roomElectricityMeter;
    data['tenant_electricity_meter'] = this.tenantElectricityMeter;
    data['other_details'] = this.otherDetails;
    data['payment_details'] = this.paymentDetails;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PaymentDetails {
  int? id;
  int? tenantId;
  String? paymentDate;
  String? amountPaid;
  String? dueAmount;
  String? dueDate;
  String? description;
  String? createdAt;
  String? updatedAt;

  PaymentDetails(
      {this.id,
      this.tenantId,
      this.paymentDate,
      this.amountPaid,
      this.dueAmount,
      this.dueDate,
      this.description,
      this.createdAt,
      this.updatedAt});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    paymentDate = json['payment_date'];
    amountPaid = json['amount_paid'];
    dueAmount = json['due_amount'];
    dueDate = json['due_date'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['payment_date'] = this.paymentDate;
    data['amount_paid'] = this.amountPaid;
    data['due_amount'] = this.dueAmount;
    data['due_date'] = this.dueDate;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
