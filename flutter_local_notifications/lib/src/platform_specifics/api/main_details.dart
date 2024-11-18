// ignore_for_file: public_member_api_docs, one_member_abstracts, always_specify_types, avoid_print, lines_longer_than_80_chars

import 'dart:io';

import 'android.dart';
import 'platform.dart';

class DetailsCollection extends DetailsCollectionBase {
  DetailsCollection(this.android);
  final AndroidDetails? android;

  @override
  T? forPlatform<T extends DetailsBase>() {
    if (Platform.isAndroid && android is T?) {
      return android as T?;
    } else {
      return null;
    }
  }
}

class Plugin extends PluginBase<DetailsCollection> {
  @override
  void show(int id, DetailsCollection? details) =>
    PluginBase.instance?.show(id, details);
}
