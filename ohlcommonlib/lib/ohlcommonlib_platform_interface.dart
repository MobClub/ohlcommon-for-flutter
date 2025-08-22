import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ohlcommonlib_method_channel.dart';

abstract class OhlcommonlibPlatform extends PlatformInterface {
  /// Constructs a OhlcommonlibPlatform.
  OhlcommonlibPlatform() : super(token: _token);

  static final Object _token = Object();

  static OhlcommonlibPlatform _instance = MethodChannelOhlcommonlib();

  /// The default instance of [OhlcommonlibPlatform] to use.
  ///
  /// Defaults to [MethodChannelOhlcommonlib].
  static OhlcommonlibPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OhlcommonlibPlatform] when
  /// they register themselves.
  static set instance(OhlcommonlibPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
