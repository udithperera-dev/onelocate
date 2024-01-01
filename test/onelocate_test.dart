import 'package:flutter_test/flutter_test.dart';
import 'package:onelocate/onelocate.dart';
import 'package:onelocate/onelocate_platform_interface.dart';
import 'package:onelocate/onelocate_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnelocatePlatform
    with MockPlatformInterfaceMixin
    implements OnelocatePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OnelocatePlatform initialPlatform = OnelocatePlatform.instance;

  test('$MethodChannelOnelocate is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOnelocate>());
  });

  test('getPlatformVersion', () async {
    Onelocate onelocatePlugin = Onelocate();
    MockOnelocatePlatform fakePlatform = MockOnelocatePlatform();
    OnelocatePlatform.instance = fakePlatform;

    expect(await onelocatePlugin.getPlatformVersion(), '42');
  });
}
