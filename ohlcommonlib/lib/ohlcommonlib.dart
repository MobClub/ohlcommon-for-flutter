import 'dart:async';

import 'package:flutter/services.dart';

class OHLcommonlib {
  static const MethodChannel _channel =
      const MethodChannel('com.ohaola.sdk.ohlcommonlib');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void intApp(String appKey, String appSecret) {
    Map args = {"appKey": appKey, "appSecret": appSecret};
    _channel.invokeMethod('registerApp', args);
  }

  static Future submitPolicyGrantResult(
      bool granted, Function(dynamic ret, Map? err)? result) {
    Map args = {"granted": granted};
    Future<dynamic> callback =
        _channel.invokeMethod('submitPolicyGrantResult', args);
    callback.then((dynamic response) {
      if (result != null) {
        if (response is Map) {
          result(response["ret"], response["err"]);
        } else {
          result(null, null);
        }
      }
    });
    return callback;
  }
}
