import 'package:project_una/data/Network/baseapiservices.dart';
import 'package:project_una/data/Network/networkapiservices.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/transactionmodal.dart';
import 'package:project_una/repository/usrls.dart';

class PaymentRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> payment(TransactionModal data) async {
    String? bearerToken = await SecureStore.getBearertoken();
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.paymentpost,
          data.toServerMap(),
          {"Authorization": "Bearer $bearerToken"});
    } catch (e) {
      rethrow;
    }
  }
    Future<dynamic> donate(TransactionModal data) async {
    String? bearerToken = await SecureStore.getBearertoken();
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.donatepost,
          data.toServerMap(),
          {"Authorization": "Bearer $bearerToken"});
    } catch (e) {
      rethrow;
    }
  }

}
