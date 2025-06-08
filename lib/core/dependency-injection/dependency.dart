import 'package:flutter_kasir/core/network/app_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

void initDependency() {
  // dio
  Dio dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ),
  );
  dio.interceptors.add(AppInterceptor());
  sl.registerSingleton<Dio>(dio);
}
