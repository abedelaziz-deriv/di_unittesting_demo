import 'package:data/src/models/articles/articles_data_model.dart';
import 'package:data/src/source/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:remote/remote.dart';

import '../../mock/mocks.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([ArticlesService])
void main() {
  late RemoteDataSource remoteDataSource;

  late ArticlesService articlesService;

  setUp(() {
    articlesService = MockArticlesService();

    remoteDataSource = RemoteDataSource(articlesService: articlesService);
  });

  test('should get most emailed list of articles upon retrieval from remote',
      () async {
    when(articlesService.getMostEmailedArticles())
        .thenAnswer((_) async => mockMappedResponse);

    final List<ArticlesDataModel> articles =
        await remoteDataSource.getMostEmailedArticles();
    expect(articles, isNotNull);
    expect(articles.length, equals(mockMappedResponse.results.length));

    verify(articlesService.getMostEmailedArticles()).called(1);
  });

  test('should get most viewed list of articles upon retrieval from remote',
      () async {
    when(articlesService.getMostViewedArticles())
        .thenAnswer((_) async => mockMappedResponse);

    final List<ArticlesDataModel> articles =
        await remoteDataSource.getMostViewedArticles();
    expect(articles, isNotNull);
    expect(articles.length, equals(mockMappedResponse.results.length));

    verify(articlesService.getMostViewedArticles()).called(1);
  });

  test('should get most shared list of articles upon retrieval from remote',
      () async {
    when(articlesService.getMostSharedArticles())
        .thenAnswer((_) async => mockMappedResponse);

    final List<ArticlesDataModel> articles =
        await remoteDataSource.getMostSharedArticles();
    expect(articles, isNotNull);
    expect(articles.length, equals(mockMappedResponse.results.length));

    verify(articlesService.getMostSharedArticles()).called(1);
  });
}
