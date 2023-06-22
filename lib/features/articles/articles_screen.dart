import 'package:data/data.dart';
import 'package:di_unittesting_demo/core/enums.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_cubit.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_state.dart';
import 'package:di_unittesting_demo/keys/articles/articles_screen_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late ArticlesCubit _articlesCubit;

  @override
  void initState() {
    super.initState();

    _articlesCubit = BlocProvider.of<ArticlesCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final ContentType type =
        ModalRoute.of(context)?.settings.arguments as ContentType;
    _articlesCubit.getArticles(type: type);

    return Scaffold(
      key: articlesScreenKey,
      appBar: AppBar(
        title: Text(_screenTitle(type)),
      ),
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
          bloc: _articlesCubit,
          builder: (BuildContext context, ArticlesState state) {
            if (state is ArticlesLoadingState) {
              // In real applications, you won't probably do that, it is bad to
              // hide the data when contents are refreshed. This is a just a demo.
              return const Center(
                  key: articlesScreenLoadingKey,
                  child: CircularProgressIndicator());
            } else if (state is ArticlesLoadedState) {
              return RefreshIndicator(
                key: articlesScreenListKey,
                onRefresh: () async {
                  _articlesCubit.getArticles(type: type, forceUpdate: true);
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ArticlesDataModel article = state.articles[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ListTile(
                          key: articlesScreenOpenBrowserKey(index),
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: article.image != null
                                  ? Image.network(
                                      article.image!,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, image, stacktrace) {
                                        return Image.asset(
                                          'assets/placeholder.jpg',
                                          width: 60,
                                          height: 75,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      'assets/placeholder.jpg',
                                      key: articlesScreenImagePlaceholderKey,
                                      width: 60,
                                      height: 75,
                                      fit: BoxFit.cover,
                                    )),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              article.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ),
                          subtitle: Text(
                            article.summary,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                          trailing: const SizedBox(
                              height: double.infinity,
                              child: Icon(Icons.chevron_right)),
                          onTap: () async =>
                              await _articlesCubit.launchURL(article.url),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 8),
                          child: Text(article.publishedDate),
                        ),
                        const Divider()
                      ],
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink(
              key: articlesScreenEmptyViewKey,
            );
          }),
    );
  }

  String _screenTitle(ContentType type) {
    switch (type) {
      case ContentType.mostEmailed:
        return 'Most Emailed';
      case ContentType.mostViewed:
        return 'Most Viewed';
      case ContentType.mostShared:
        return 'Most Shared';
    }
  }
}
