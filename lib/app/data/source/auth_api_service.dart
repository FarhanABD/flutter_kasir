import 'package:dio/dio.dart';
import 'package:flutter_kasir/core/constant/constant.dart';
import 'package:flutter_kasir/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) {
    return _AuthApiService(dio);
  }
  // Method
  @POST(AUTH_URL)
  Future<HttpResponse<DataState>> login({@Body() Map<String, dynamic> body});
}
