import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'focus111_method_channel.dart';

abstract class Focus111Platform extends PlatformInterface {
  /// Constructs a Focus111Platform.
  Focus111Platform() : super(token: _token);

  static final Object _token = Object();

  static Focus111Platform _instance = MethodChannelFocus111();

  /// The default instance of [Focus111Platform] to use.
  ///
  /// Defaults to [MethodChannelFocus111].
  static Focus111Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Focus111Platform] when
  /// they register themselves.
  static set instance(Focus111Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
