import 'dart:io';

import 'package:flutter/foundation.dart';

import 'msix.dart';

/// Utility methods for resolving Flutter assets for different build modes.
class WindowsAssetUtils {
  /// Returns a [File] for a [Flutter asset](https://docs.flutter.dev/ui/assets/assets-and-images#loading-images).
  ///
  /// - In debug mode, resolves to a file to the asset itself
  /// - In non-MSIX release builds, resolves to a file to the bundled asset
  /// - In MSIX releases, resolves to null
  ///
  /// MSIX bundles don't support getting the file path for assets. Use
  /// [getAssetUri] to get an `ms-appx`-style [Uri] instead of a [File].
  static File? getAssetFile(String assetPath) {
    if (kDebugMode) {
      return File(assetPath);
    } else if (MsixUtils.hasPackageIdentity()) {
      return null; // msix has its own icon in the msix_config
    } else {
      return File('data/flutter_assets/$assetPath');
    }
  }

  /// Returns a [Uri] for a [Flutter asset](https://docs.flutter.dev/ui/assets/assets-and-images#loading-images).
  ///
  /// - In debug mode, resolves to a file URI to the asset itself
  /// - In non-MSIX release builds, resolves to a file URI to the bundled asset
  /// - In MSIX releases, resolves to `ms-appx` URI from [MsixUtils.getAssetUri]
  static Uri getAssetUri(String assetPath) {
    if (kDebugMode) {
      return Uri.file(File(assetPath).windowsPath, windows: true);
    } else if (MsixUtils.hasPackageIdentity()) {
      return MsixUtils.getAssetUri(assetPath);
    } else {
      final File file = File('data/flutter_assets/$assetPath');
      return Uri.file(file.windowsPath, windows: true);
    }
  }
}

/// Utility methods for files on Windows.
extension WindowsFileUtils on File {
  /// Returns a Windows-style path for this file.
  String get windowsPath => absolute.path.replaceAll('/', r'\');
}
