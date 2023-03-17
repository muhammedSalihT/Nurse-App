import 'package:flutter/material.dart';
import 'package:project_una/view_model/loading_button.dart';

class LoadingButtonProvider extends ChangeNotifier {
  LoadingButton modelw = LoadingButton();

  LoadingButton get model => modelw;

  void setLoading(bool loading) {
    modelw.setLoading(loading);
    notifyListeners();
  }
}
