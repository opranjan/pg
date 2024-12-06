class RoomModel {
  int? capacity;
  String? price;
  int? availability;
  String? unitType;
  String? sharingType;
  String? name;
  String? rent;
  String? maximum;
  String? minimum;
  int? areaSqft;
  String? remarks;
  // List<String>? facilities;
  dynamic lastReading;
  String? date;
  // List<String>? other;

  RoomModel(
      {this.capacity,
      this.price,
      this.availability,
      this.unitType,
      this.sharingType,
      this.name,
      this.rent,
      this.maximum,
      this.minimum,
      this.areaSqft,
      this.remarks,
      // this.facilities,
      this.lastReading,
      this.date,
      // this.other
      });

  RoomModel.fromJson(Map<String, dynamic> json) {
    capacity = json['capacity'];
    price = json['price'];
    availability = json['availability'];
    unitType = json['unit_type'];
    sharingType = json['sharing_type'];
    name = json['name'];
    rent = json['rent'];
    maximum = json['maximum'];
    minimum = json['minimum'];
    areaSqft = json['area_sqft'];
    remarks = json['remarks'];
    // facilities = json['facilities'].cast<String>();
    lastReading = json['last_reading'];
    date = json['date'];
    // other = json['other'].cast<String>();
  }

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    data['availability'] = this.availability;
    data['unit_type'] = this.unitType;
    data['sharing_type'] = this.sharingType;
    data['name'] = this.name;
    data['rent'] = this.rent;
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    data['area_sqft'] = this.areaSqft;
    data['remarks'] = this.remarks;
    // data['facilities'] = this.facilities;
    data['last_reading'] = this.lastReading;
    data['date'] = this.date;
    // data['other'] = this.other;
    return data;
  }
}
