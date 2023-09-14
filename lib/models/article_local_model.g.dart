// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_local_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ArticleLocal extends _ArticleLocal
    with RealmEntity, RealmObjectBase, RealmObject {
  ArticleLocal(
    String author,
    String title,
    String description,
    String url,
    String urlToImage,
    DateTime publishedAt,
    String content,
  ) {
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'urlToImage', urlToImage);
    RealmObjectBase.set(this, 'publishedAt', publishedAt);
    RealmObjectBase.set(this, 'content', content);
  }

  ArticleLocal._();

  @override
  String get author => RealmObjectBase.get<String>(this, 'author') as String;
  @override
  set author(String value) => RealmObjectBase.set(this, 'author', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get url => RealmObjectBase.get<String>(this, 'url') as String;
  @override
  set url(String value) => RealmObjectBase.set(this, 'url', value);

  @override
  String get urlToImage =>
      RealmObjectBase.get<String>(this, 'urlToImage') as String;
  @override
  set urlToImage(String value) =>
      RealmObjectBase.set(this, 'urlToImage', value);

  @override
  DateTime get publishedAt =>
      RealmObjectBase.get<DateTime>(this, 'publishedAt') as DateTime;
  @override
  set publishedAt(DateTime value) =>
      RealmObjectBase.set(this, 'publishedAt', value);

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObjectBase.set(this, 'content', value);

  @override
  Stream<RealmObjectChanges<ArticleLocal>> get changes =>
      RealmObjectBase.getChanges<ArticleLocal>(this);

  @override
  ArticleLocal freeze() => RealmObjectBase.freezeObject<ArticleLocal>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ArticleLocal._);
    return const SchemaObject(
        ObjectType.realmObject, ArticleLocal, 'ArticleLocal', [
      SchemaProperty('author', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('url', RealmPropertyType.string),
      SchemaProperty('urlToImage', RealmPropertyType.string),
      SchemaProperty('publishedAt', RealmPropertyType.timestamp),
      SchemaProperty('content', RealmPropertyType.string),
    ]);
  }
}
