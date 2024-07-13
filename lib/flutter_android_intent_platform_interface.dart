import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_intent_method_channel.dart';

abstract class FlutterAndroidIntentPlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidIntentPlatform.
  FlutterAndroidIntentPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidIntentPlatform _instance = MethodChannelFlutterAndroidIntent();

  /// The default instance of [FlutterAndroidIntentPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroidIntent].
  static FlutterAndroidIntentPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidIntentPlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidIntentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
