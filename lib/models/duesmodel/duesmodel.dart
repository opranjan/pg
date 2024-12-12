class DuesModel {
  final int id;
  final int tenantId;
  final String amount;
  final String date;
  final String remark;
  final String dueType;
  final String createdAt;
  final String updatedAt;
  final Tenant tenant;

  DuesModel({
    required this.id,
    required this.tenantId,
    required this.amount,
    required this.date,
    required this.remark,
    required this.dueType,
    required this.createdAt,
    required this.updatedAt,
    required this.tenant,
  });

  factory DuesModel.fromJson(Map<String, dynamic> json) {
    return DuesModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      amount: json['amount'],
      date: json['date'],
      remark: json['remark'],
      dueType: json['due_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tenant: Tenant.fromJson(json['tenant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'amount': amount,
      'date': date,
      'remark': remark,
      'due_type': dueType,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'tenant': tenant.toJson(),
    };
  }
}

class Tenant {
  final int id;
  final String name;
  final String phone;
  final String? altPhone;
  final String createdAt;
  final String updatedAt;

  Tenant({
    required this.id,
    required this.name,
    required this.phone,
    this.altPhone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      altPhone: json['altphone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'altphone': altPhone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
