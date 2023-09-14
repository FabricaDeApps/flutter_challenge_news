import 'package:example_news/models/article_model.dart';
import 'package:example_news/models/response_model.dart';
import 'package:example_news/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:example_news/models/article_local_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIRepository apiRepository = APIRepository();
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  getData() async {
    ResponseNews? responseNews = await apiRepository.getNews();
    if (responseNews != null) {
      setState(() {
        articles = responseNews.articles;
      });
    } else {}
  }

  saveFavorite(Article article) {
    var config = Configuration.local([ArticleLocal.schema]);
    var realm = Realm(config);
    var car = ArticleLocal(
        article.author ?? "",
        article.title!,
        article.description,
        article.url,
        article.urlToImage!,
        article.publishedAt,
        article.content);
    realm.write(() {
      realm.add(car);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return await getData();
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('News List'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(articles[index].title!,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        subtitle: Text(articles[index].content,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {
                            saveFavorite(articles[index]);
                          },
                        ),
                      ),
                    ),
                  );
                },
                childCount: articles.length,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
