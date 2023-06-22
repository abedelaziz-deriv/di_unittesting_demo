import 'package:data/src/mappers/articles_mapper.dart';
import 'package:data/src/models/articles/articles_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote.dart';

import 'data_source.dart';

@singleton
class RemoteDataSource extends DataSource {
  RemoteDataSource({required this.articlesService});

  final ArticlesService articlesService;

  Future<List<ArticlesDataModel>> getMostEmailedArticles() async =>
      _getMappedArticles(await articlesService.getMostEmailedArticles());

  Future<List<ArticlesDataModel>> getMostViewedArticles() async =>
      _getMappedArticles(await articlesService.getMostViewedArticles());

  Future<List<ArticlesDataModel>> getMostSharedArticles() async =>
      _getMappedArticles(await articlesService.getMostSharedArticles());
}

List<ArticlesDataModel> _getMappedArticles(
        ArticlesResponseModel articlesResponseModel) =>
    articlesResponseModel.results
        .map((ArticleModel model) => model.articlesModel)
        .toList();


