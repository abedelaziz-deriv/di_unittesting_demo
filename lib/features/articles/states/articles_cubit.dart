import 'package:data/data.dart';
import 'package:di_unittesting_demo/core/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(const ArticlesInitialState());

  final ArticlesRepository _repository = GetIt.instance<ArticlesRepository>();

  Future<void> getArticles(
      {required ContentType type, bool forceUpdate = false}) async {
    emit(const ArticlesLoadingState());

    List<ArticlesDataModel> articles = [];

    switch (type) {
      case ContentType.mostEmailed:
        articles = await _repository.getMostEmailedArticles();
        break;
      case ContentType.mostViewed:
        articles = await _repository.getMostViewedArticles();
        break;
      case ContentType.mostShared:
        articles = await _repository.getMostSharedArticles();
        break;
    }

    emit(ArticlesLoadedState(articles));
  }

  Future<void> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
