import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_intent/flutter_android_intent.dart';
import 'package:flutter_android_intent/flutter_android_intent_platform_interface.dart';
import 'package:flutter_android_intent/flutter_android_intent_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidIntentPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidIntentPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAndroidIntentPlatform initialPlatform =
      FlutterAndroidIntentPlatform.instance;

  test('$MethodChannelFlutterAndroidIntent is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroidIntent>());
  });

  test('getPlatformVersion', () async {
    FlutterAndroidIntent flutterAndroidIntentPlugin = FlutterAndroidIntent();
    MockFlutterAndroidIntentPlatform fakePlatform =
        MockFlutterAndroidIntentPlatform();
    FlutterAndroidIntentPlatform.instance = fakePlatform;

    expect(await flutterAndroidIntentPlugin.getPlatformVersion(), '42');
  });
}
