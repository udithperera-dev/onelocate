
import 'onelocate_platform_interface.dart';

class Onelocate {
  Future<String?> getPlatformVersion() {
    return OnelocatePlatform.instance.getPlatformVersion();
  }

  Future<Map<dynamic, dynamic>?> getLocation() {
    return OnelocatePlatform.instance.getLocation();
  }
}
