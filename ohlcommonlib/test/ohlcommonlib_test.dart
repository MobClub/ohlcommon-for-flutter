import 'package:flutter_test/flutter_test.dart';
import 'package:ohlcommonlib/ohlcommonlib.dart';
import 'package:ohlcommonlib/ohlcommonlib_platform_interface.dart';
import 'package:ohlcommonlib/ohlcommonlib_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOhlcommonlibPlatform
    with MockPlatformInterfaceMixin
    implements OhlcommonlibPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OhlcommonlibPlatform initialPlatform = OhlcommonlibPlatform.instance;

  test('$MethodChannelOhlcommonlib is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOhlcommonlib>());
  });

  test('getPlatformVersion', () async {
    Ohlcommonlib ohlcommonlibPlugin = Ohlcommonlib();
    MockOhlcommonlibPlatform fakePlatform = MockOhlcommonlibPlatform();
    OhlcommonlibPlatform.instance = fakePlatform;

    expect(await ohlcommonlibPlugin.getPlatformVersion(), '42');
  });
}
