import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'onelocate_method_channel.dart';

abstract class OnelocatePlatform extends PlatformInterface {
  /// Constructs a OnelocatePlatform.
  OnelocatePlatform() : super(token: _token);

  static final Object _token = Object();

  static OnelocatePlatform _instance = MethodChannelOnelocate();

  /// The default instance of [OnelocatePlatform] to use.
  ///
  /// Defaults to [MethodChannelOnelocate].
  static OnelocatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnelocatePlatform] when
  /// they register themselves.
  static set instance(OnelocatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///for get OS version
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///for get location details
  Future<Map<dynamic, dynamic>?> getLocation() {
    throw UnimplementedError('getLocation() has not been implemented.');
  }
}
