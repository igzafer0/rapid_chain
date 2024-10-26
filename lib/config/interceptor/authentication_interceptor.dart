// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rapid_chain/config/data/authentication_manager.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/data/dto/receive/auth/token_model.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/preference_key_enum.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/authentication_source.dart';

class AuthenticationInterceptor implements Interceptor {
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null &&
        err.requestOptions.path != SourcePath.REFRESH_TOKEN.rawValue() &&
        err.requestOptions.path != SourcePath.RESET_PASSWORD.rawValue() &&
        err.requestOptions.path != SourcePath.CHANGE_PASSWORD.rawValue() &&
        err.response?.statusCode == 401) {
      try {
        var response = await locator<RemoteManager>().networkManager.request(
              err.response!.realUri.path,
              data: err.response?.data,
              options: Options(
                method: err.requestOptions.method,
                contentType: err.requestOptions.contentType,
                headers: err.requestOptions.headers,
                extra: err.requestOptions.extra,
              ),
            );
        handler.resolve(response);
      } on DioException catch (_) {
        handler.next(err);
      }
    } else {
      if (err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.sendTimeout) {
        var response = await locator<RemoteManager>()
            .networkManager
            .request(err.requestOptions.uri.path,
                data: err.requestOptions.data,
                options: Options(
                  sendTimeout: const Duration(seconds: 5),
                  receiveTimeout: const Duration(seconds: 5),
                  method: err.requestOptions.method,
                  contentType: err.requestOptions.contentType,
                  headers: err.requestOptions.headers,
                  extra: err.requestOptions.extra,
                ));

        handler.resolve(response);
      } else {
        handler.next(err);
      }
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.path.startsWith("/auth") ||
        options.path == "/auth/changepassword") {
      locator<AuthenticationManager>().validateRequest(options, handler);
    } else {
      if (options.path == SourcePath.RESET_PASSWORD.rawValue()) {
        options.headers.addAll({
          "Authorization":
              "Bearer ${locator<AuthenticationSource>().resetPasswordToken}"
        });
      }
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.realUri.path.startsWith("/auth")) {
      if (response.realUri.path == SourcePath.LOGIN.rawValue() ||
          response.realUri.path == SourcePath.REGISTER.rawValue() ||
          response.realUri.path == SourcePath.CHANGE_PASSWORD.rawValue() ||
          response.realUri.path == SourcePath.RESET_PASSWORD.rawValue()) {
        var result = TokenModel.fromJson(response.data);
        locator<AuthenticationSource>()
            .setAccessToken(result.accessTokenModel!);
        locator<SharedManager>().setStringValue(
            PreferenceKey.REFRESH_TOKEN, result.refreshToken ?? "");

        debugPrint(
            "debugprint ${locator<AuthenticationSource>().getAccessToken()?.token}");
      }
    }
    handler.next(response);
  }
}
