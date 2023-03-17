class TransactionModal {
  TransactionModal({
    this.pId,
    this.phone,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.paymentId,
    this.paymentType,
  });

  int? pId;
  String? phone;
  String? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? paymentId;
  String? paymentType;



  factory TransactionModal.fromJson(Map<String, dynamic> json) =>
      TransactionModal(
        pId: json["p_id"],
        phone: json["phone"],
        amount: json["amount"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        paymentId: json["payment_id"],
        paymentType: json["payment_type"],



      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "phone": phone,
        "amount": amount,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "payment_id": paymentId,
        "payment_type": paymentType,



      };

  Map<String, dynamic> toServerMap() => {
        'payment_id': paymentId ?? "",
        'phone': phone,
        'amount': amount,
        'status': status
      };
}
