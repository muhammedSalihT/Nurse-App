import 'package:flutter/foundation.dart';

class LokginViewModel with ChangeNotifier {
  bool isLoading = false;

  bool get isloading => isLoading;

  setLoading(bool value) {
    isLoading = value;
  }
}
