import 'dart:async';
import 'package:flutter/services.dart';

class FlutterAndroidIntent {
  static const MethodChannel _channel = MethodChannel('flutter_android_intent');

  Future<String?> getPlatformVersion() async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> launchUrl({required String url}) async {
    await _channel.invokeMethod('launchUrl', {'url': url});
  }

  static Future<void> sendEmail({
    required String to,
    String? subject,
    String? body,
  }) async {
    await _channel.invokeMethod('sendEmail', {
      'to': to,
      'subject': subject,
      'body': body,
    });
  }

  static Future<void> openAppViaClassName({
    required String packageName,
    required String className,
  }) async {
    await _channel.invokeMethod('openAppViaClassName', {
      'packageName': packageName,
      'className': className,
    });
  }
}
