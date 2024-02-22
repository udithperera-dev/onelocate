import 'onelocate_platform_interface.dart';

class Onelocate {
  ///for get OS version
  Future<String?> getPlatformVersion() {
    return OnelocatePlatform.instance.getPlatformVersion();
  }

  ///for get location details
  Future<Map<dynamic, dynamic>?> getLocation() {
    return OnelocatePlatform.instance.getLocation();
  }
}
