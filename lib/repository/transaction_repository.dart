import 'dart:developer';
import 'package:project_una/data/Network/networkapiservices.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/transactionmodal.dart';
import 'package:project_una/repository/usrls.dart';
import '../data/Network/baseapiservices.dart';

class TransactionRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future GetHistoryByPhone(String data) async {
    String? bearerToken = await SecureStore.getBearertoken();
    String? email =await SecureStore.getEmail();
    try {
      List<TransactionModal> result = List.empty(growable: true);
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrls.transactionhistory, {"Authorization": "Bearer $bearerToken"});

      log(response.toString());
      var res = response["data"];
      for (var map in res) {
        result.add(TransactionModal.fromJson(map));
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
