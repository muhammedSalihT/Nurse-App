import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_una/model/transactionmodal.dart';
import 'package:project_una/repository/payment_repository.dart';

class PaymentScreenViewModal with ChangeNotifier {
  TransactionModal paymentResponse = TransactionModal();
  final _myrepo = PaymentRepository();
  final _mydonaterepo =PaymentRepository();
  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> payment(BuildContext conext) async {
    setLoading(true);
    _myrepo.payment(paymentResponse).then((value) {
      setLoading(false);
      log("Payment success");
    }).onError((error, stackTrace) {
      setLoading(false);
      log(error.toString());
    });
  }



  Future<void> donate(BuildContext conext) async {
    setLoading(true);
    _mydonaterepo.donate(paymentResponse).then((value) {
      setLoading(false);
      // log(value.toString());
      log("Donation success");
    }).onError((error, stackTrace) {
      setLoading(false);
      log(error.toString());
    });
  }



}
