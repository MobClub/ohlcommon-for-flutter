import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ohlcommonlib_platform_interface.dart';

/// An implementation of [OhlcommonlibPlatform] that uses method channels.
class MethodChannelOhlcommonlib extends OhlcommonlibPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ohlcommonlib');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
