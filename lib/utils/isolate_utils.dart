import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as imageLib;
import 'package:flutter_realtime_object_detection/tflite/classifier.dart';
import 'package:flutter_realtime_object_detection/utils/image_utils.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

/// Manages separate Isolate instance for inference
class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  Isolate? _isolate;
  final ReceivePort _receivePort = ReceivePort();
  SendPort? _sendPort;

  SendPort? get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(
      entryPoint,
      _receivePort.sendPort,
      debugName: DEBUG_NAME,
    );

    _sendPort = await _receivePort.first;
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final IsolateData? isolateData in port) {
      if (isolateData != null) {
        Classifier classifier = Classifier(
          interpreter:
          Interpreter.fromAddress(isolateData.interpreterAddress ?? 0),
          labels: isolateData.labels ?? [],
        );
        imageLib.Image? image =
        ImageUtils.convertCameraImage(isolateData.cameraImage!);
        if (Platform.isAndroid) {
          image = imageLib.copyRotate(image!, 90);
        }
        Map<String, dynamic>? results = classifier.predict(image!);
        isolateData.responsePort!.send(results);
      }
    }
  }

  void stopIsolate() {
    _isolate?.kill();
  }
}

/// Bundles data to pass between Isolate
class IsolateData {
  CameraImage? cameraImage;
  int? interpreterAddress;
  List<String>? labels;
  SendPort? responsePort;

  IsolateData(
      this.cameraImage,
      this.interpreterAddress,
      this.labels,
      this.responsePort,
      );
}
