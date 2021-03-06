import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterDtmf {
  static const MethodChannel _channel = const MethodChannel('flutter_dtmf');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> playTone(
      {@required String digits, double samplingRate, int duration, int volume}) async {
    assert(digits != null);
    final Map<String, Object> args = <String, dynamic>{
      "digits": digits,
      "samplingRate": samplingRate,
      "duration": duration,
      "volume": volume
    };
    await _channel.invokeMethod('playTone', args);
  }
}
