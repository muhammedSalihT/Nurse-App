import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:project_una/model/transactionmodal.dart';
import 'package:project_una/repository/transaction_repository.dart';

class TransactionViewModal with ChangeNotifier {
  final _myRepo = TransactionRepository();
  List<TransactionModal> historyList = List.empty(growable: true);

  bool loading = false;
  bool TextLoading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void setListLoading(bool value) {
    TextLoading = value;
    notifyListeners();
  }

  Future<void> GetHistoryByPhone(String Phone, BuildContext context) async {
    try {
      setLoading(true);
      historyList = await _myRepo.GetHistoryByPhone(Phone);
      if (historyList.isEmpty) {
        setListLoading(true);
      } else {
        setListLoading(false);
      }

      notifyListeners();
      setLoading(false);

      notifyListeners();
    } catch (e) {
      setLoading(false);
      log(e.toString());
      rethrow;
    }
  }
}
