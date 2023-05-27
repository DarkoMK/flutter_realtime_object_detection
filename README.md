# Flutter Realtime Object Detection with TensorFlow Lite and YOLOv5

This repository contains a Flutter application that performs realtime object detection using TensorFlow Lite and the YOLOv5 model. By integrating machine learning capabilities into your Flutter app, you can create powerful applications that can detect and identify objects in real time.

## Overview

- The YOLOv5 model is a popular object detection algorithm known for its speed and accuracy.
- TensorFlow Lite is a lightweight version of the TensorFlow framework designed for mobile and embedded devices.
- Flutter is an open-source UI framework developed by Google for building native applications for iOS, Android, and the web.

## Features

- Realtime object detection: The Flutter app utilizes the YOLOv5 model to detect and classify objects in real time.
- Camera integration: The app accesses the device's camera to capture video frames for object detection.
- User-friendly interface: The app provides a user-friendly interface to display the video feed and detected objects.

## Getting Started

To get started with the Flutter Realtime Object Detection app, follow these steps:

1. Clone the repository:

`git clone https://github.com/DarkoMK/flutter_realtime_object_detection.git`

2. Navigate to the project directory:

`cd flutter_realtime_object_detection`

3. Install the Flutter dependencies:

`flutter pub get`

4. Build and run the app:

`flutter run`

This command will launch the app on a connected device or emulator.

## Dependencies

The Flutter Realtime Object Detection app relies on the following dependencies:

- `tflite_flutter`: This package provides TensorFlow Lite support for Flutter.
- `camera`: This package allows access to the device's camera for capturing video frames.
- `image`: This package provides image processing utilities.

These dependencies are defined in the `pubspec.yaml` file and will be automatically resolved when running `flutter pub get`.

## Resources used

For more information about TensorFlow Lite and YOLOv5, refer to the following resources:

- [TensorFlow Lite](https://www.tensorflow.org/lite)
- [YOLOv5 GitHub Repository](https://github.com/ultralytics/yolov5)
- [Real-time object detection using new TensorFlow Lite Flutter Support](https://medium.com/@am15hg/real-time-object-detection-using-new-tensorflow-lite-flutter-support-ea41263e801d)

## Contributing

This is a Seminar Research Project, not intended for further developing.

## License

This project is licensed under the [MIT License](LICENSE).
