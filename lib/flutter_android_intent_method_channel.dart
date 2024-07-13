import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_intent_platform_interface.dart';

/// An implementation of [FlutterAndroidIntentPlatform] that uses method channels.
class MethodChannelFlutterAndroidIntent extends FlutterAndroidIntentPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_intent');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
