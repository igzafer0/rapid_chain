import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/config/navigation/navigation_route.dart';
import 'package:rapid_chain/data/dto/receive/auth/token_model.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/enum/preference_key_enum.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/authentication_source.dart';

class AuthenticationManager {
  List<Map<RequestInterceptorHandler, RequestOptions>> tail = [];
  bool tailMode = false;
  Future<void> validateRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!locator<AuthenticationSource>().isTokenStillValid()) {
      tail.add({handler: options});
      if (!tailMode) {
        _refreshTokenRequest(options, handler);
      }
    } else {
      options.headers.addAll({
        "Authorization":
            "Bearer ${locator<AuthenticationSource>().getAccessToken()?.token}"
      });
      handler.next(options);
    }
  }

  Future<void> _refreshTokenRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    tailMode = true;

    debugPrint("refreshtoken");

    final networkManager = Dio(
      BaseOptions(
        headers: {
          "Authorization":
              "Bearer ${locator<SharedManager>().getStringValue(PreferenceKey.REFRESH_TOKEN)}"
        },
        baseUrl: "https://testdep.denizegece.com.tr",
      ),
    );
    try {
      var result = await networkManager.post(
        SourcePath.REFRESH_TOKEN.rawValue(),
        options: Options(headers: {
          "Authorization":
              "Bearer ${locator<SharedManager>().getStringValue(PreferenceKey.REFRESH_TOKEN)}"
        }),
      );
      locator<AuthenticationSource>()
          .setAccessToken(AccessTokenModel.fromJson(result.data));
      options.headers.addAll({
        "Authorization":
            "Bearer ${locator<AuthenticationSource>().getAccessToken()?.token}"
      });
      _runTail();
    } on DioException catch (_) {
      router.pushReplacementNamed(NavigationConstant.LOGIN);
    }
    tail.clear();
    tailMode = false;
  }

  _runTail() {
    for (var element in tail) {
      element.forEach((key, value) {
        key.next(value);
      });
    }
  }
}
