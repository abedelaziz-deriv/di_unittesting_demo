import 'package:data/src/models/articles/articles_data_model.dart';
import 'package:data/src/repository/articles_repository.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:data/src/source/local_data_source.dart';
import 'package:data/src/source/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_data_model.dart';
import 'articles_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  late ArticlesRepository articlesRepository;
  late DataSourceFactory dataSourceFactory;

  late RemoteDataSource remoteDataSource;
  late LocalDataSource localDataSource;

  setUpAll(() {
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();

    dataSourceFactory = DataSourceFactory(
        remoteDataSource: remoteDataSource, localDataSource: localDataSource);

    articlesRepository =
        ArticlesRepository(dataSourceFactory: dataSourceFactory);
  });

  test('should get list of articles when getMostEmailedArticles is called',
      () async {
    when(dataSourceFactory.remoteDataSource.getMostEmailedArticles())
        .thenAnswer((_) async {
      return mockArticles;
    });

    final List<ArticlesDataModel> response =
        await articlesRepository.getMostEmailedArticles();
    expect(response.length, mockArticles.length);
    expect(response.first.id, mockArticles.first.id);
  });

  test('should get list of articles when getMostSharedArticles is called',
      () async {
    when(dataSourceFactory.remoteDataSource.getMostSharedArticles())
        .thenAnswer((_) async {
      return mockArticles;
    });

    final List<ArticlesDataModel> response =
        await articlesRepository.getMostSharedArticles();
    expect(response.length, mockArticles.length);
    expect(response.first.id, mockArticles.first.id);
  });

  test('should get list of articles when getMostViewedArticles is called',
      () async {
    when(dataSourceFactory.remoteDataSource.getMostViewedArticles())
        .thenAnswer((_) async {
      return mockArticles;
    });

    final List<ArticlesDataModel> response =
        await articlesRepository.getMostViewedArticles();
    expect(response.length, mockArticles.length);
    expect(response.first.id, mockArticles.first.id);
  });
}
