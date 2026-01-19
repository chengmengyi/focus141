import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'focus111_platform_interface.dart';

/// An implementation of [Focus111Platform] that uses method channels.
class MethodChannelFocus111 extends Focus111Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('focus111');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
