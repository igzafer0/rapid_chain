import 'package:dio/dio.dart';
import 'package:rapid_chain/config/interceptor/authentication_interceptor.dart';

class RemoteManager {
  late Dio networkManager;
  RemoteManager() {
    networkManager = Dio(
      BaseOptions(
        validateStatus: (status) => status == 200 || status == 204,
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: "https://atalay.denizegece.com.tr",
      ),
    )..interceptors.addAll([AuthenticationInterceptor()]);
  }
}
