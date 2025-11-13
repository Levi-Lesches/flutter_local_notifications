import 'notification_parts.dart';

/// Plugin initialization settings for Windows.
class WindowsInitializationSettings {
  /// Creates a new settings object for initializing this plugin on Windows.
  const WindowsInitializationSettings({
    required this.appName,
    required this.appUserModelId,
    required this.guid,
    required this.iconAssetPath,
  });

  /// The name of the app that should be shown in the notification toast.
  final String appName;

  /// The unique app user model ID that identifies the app,
  /// in the form of CompanyName.ProductName.SubProduct.VersionInformation.
  ///
  /// See https://docs.microsoft.com/en-us/windows/win32/shell/appids
  /// for more information.
  final String appUserModelId;

  /// The GUID that identifies the notification activation callback.
  final String guid;

  /// The asset path for the default icon.
  ///
  /// This icon must be a Flutter asset declared in the Pubspec, and will be
  /// shown by default. To override it on a specific notification (say, to show
  /// a user profile picture instead), use a [WindowsImage] with
  /// [WindowsImagePlacement.appLogoOverride] in your notification details.
  ///
  /// Note that for MSIX releases, you must configure the default icon in your
  /// MSIX configuration. See the Windows Setup Guide for more details.
  final String iconAssetPath;
}
