
import 'onelocate_platform_interface.dart';

class Onelocate {
  Future<String?> getPlatformVersion() {
    return OnelocatePlatform.instance.getPlatformVersion();
  }
}
