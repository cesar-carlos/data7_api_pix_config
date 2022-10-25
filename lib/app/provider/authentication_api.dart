import 'package:dio/dio.dart';
import 'package:data7_api_pix_config/app/model/login_request_model.dart';
import 'package:data7_api_pix_config/app/model/login_response_model.dart';

class AuthenticationAPI {
  final String _baseUrl = "http://localhost:3000";
  final Dio httpClient;

  AuthenticationAPI() : httpClient = Dio();

  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    final url = "$_baseUrl/login";
    final response = await httpClient.post(url, data: loginRequest.toJson());

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception("Failed to login");
    }
  }
}
