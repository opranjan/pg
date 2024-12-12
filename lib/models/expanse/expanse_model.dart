class ExpenseModel {
  final int id;
  final double amount;
  final DateTime date;
  final int propertyId;
  final String paidBy;
  final String paidTo;
  final String description;
  final String paymentMode;
  final String? uploadBill;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.propertyId,
    required this.paidBy,
    required this.paidTo,
    required this.description,
    required this.paymentMode,
    this.uploadBill,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create an ExpenseModel instance from a JSON object
  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      amount: double.tryParse(json['amount']) ?? 0.0, // Handle amount parsing
      date: DateTime.parse(json['date']),
      propertyId: json['property_id'],
      paidBy: json['paid_by'],
      paidTo: json['paid_to'],
      description: json['description'],
      paymentMode: json['payment_mode'],
      uploadBill: json['upload_bill'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert ExpenseModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount.toString(),
      'date': date.toIso8601String(),
      'property_id': propertyId,
      'paid_by': paidBy,
      'paid_to': paidTo,
      'description': description,
      'payment_mode': paymentMode,
      'upload_bill': uploadBill,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
