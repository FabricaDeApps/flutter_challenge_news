import 'package:realm/realm.dart';
part 'article_local_model.g.dart';

@RealmModel()
class _ArticleLocal {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late DateTime publishedAt;
  late String content;
}
