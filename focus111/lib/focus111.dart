
import 'focus111_platform_interface.dart';

class Focus111 {
  Future<String?> getPlatformVersion() {
    return Focus111Platform.instance.getPlatformVersion();
  }
}
