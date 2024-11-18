// ignore_for_file: public_member_api_docs, one_member_abstracts, always_specify_types, avoid_print, lines_longer_than_80_chars

import 'platform.dart';

class AndroidDetails extends DetailsBase {
  int get androidId => 3;
}

class AndroidPlugin extends PluginBase {
  @override
  void show(int id, DetailsCollectionBase? details) {
    final androidDetails = details?.forPlatform<AndroidDetails>();
    print(androidDetails?.androidId);
  }
}
