import 'dart:ui';

/// Singleton to record size related data
class CameraViewSingleton {
  static double ratio = 0.0; // Initial value assigned
  static Size screenSize = const Size(0, 0); // Initial value assigned
  static Size inputImageSize = const Size(0, 0); // Initial value assigned

  static Size get actualPreviewSize =>
      Size(screenSize.width, screenSize.width * ratio);
}
