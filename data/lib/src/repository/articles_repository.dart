import 'package:data/src/models/articles/articles_data_model.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:injectable/injectable.dart';

@singleton
class ArticlesRepository {
  ArticlesRepository({required this.dataSourceFactory});

  final DataSourceFactory dataSourceFactory;

  Future<List<ArticlesDataModel>> getMostEmailedArticles() async {
    return await dataSourceFactory.remoteDataSource.getMostEmailedArticles();
  }

  Future<List<ArticlesDataModel>> getMostSharedArticles() async {
    return await dataSourceFactory.remoteDataSource.getMostSharedArticles();
  }

  Future<List<ArticlesDataModel>> getMostViewedArticles() async {
    return await dataSourceFactory.remoteDataSource.getMostViewedArticles();
  }
}
