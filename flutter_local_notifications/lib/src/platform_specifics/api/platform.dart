// ignore_for_file: public_member_api_docs, one_member_abstracts

abstract class DetailsBase { }

abstract class DetailsCollectionBase {
  T? forPlatform<T extends DetailsBase>();
}

abstract class PluginBase<T extends DetailsCollectionBase> {
  static PluginBase<DetailsCollectionBase>? instance;

  void show(int id, T? details);
}

class Plugin extends PluginBase<DetailsCollectionBase> {
  @override
  void show(int id, DetailsCollectionBase? details) =>
    PluginBase.instance?.show(id, details);
}
