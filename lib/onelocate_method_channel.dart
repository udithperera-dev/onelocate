import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'onelocate_platform_interface.dart';

/// An implementation of [OnelocatePlatform] that uses method channels.
class MethodChannelOnelocate extends OnelocatePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('onelocate');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map<dynamic, dynamic> ?> getLocation() async {
    final version = await methodChannel.invokeMethod<Map<dynamic, dynamic>>('getLocation');
    return version;
  }
}
