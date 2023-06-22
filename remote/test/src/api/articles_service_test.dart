import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:remote/src/api/articles_service.dart';
import 'package:remote/src/api/endpoint_provider.dart';
import 'package:remote/src/models/article/articles_response_model.dart';
import 'package:get_it/get_it.dart';

import '../../mock/mock_articles_model.dart';
import 'articles_service_test.mocks.dart';

@GenerateMocks([EndpointProvider])
void main() {
  late ArticlesService articlesService;
  late RemoteServices remoteServices;

  late EndpointProvider endpointProvider;

  GetIt getIt = GetIt.instance;

  setUpAll(() {
    articlesService = ArticlesService();
    remoteServices = RemoteServices();

    endpointProvider = MockEndpointProvider();

    getIt.registerSingleton(endpointProvider);
  });

  test('should get ArticlesResponseModel when fetching most emailed articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(endpointProvider.getMostEmailedArticles())
        .thenAnswer((_) async => articlesResponseModel);

    final ArticlesResponseModel response =
        await articlesService.getMostEmailedArticles();

    expect(response, same(articlesResponseModel));
    expect(response.results.length, same(1));

    verify(articlesService.getMostEmailedArticles()).called(1);
  });

  test('should get list of ArticlesEntity when fetching most viewed articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(articlesService.getMostViewedArticles())
        .thenAnswer((_) async => articlesResponseModel);
    when(endpointProvider.getMostViewedArticles())
        .thenAnswer((_) async => articlesResponseModel);

    final ArticlesResponseModel response =
        await articlesService.getMostViewedArticles();

    expect(response, same(articlesResponseModel));
    expect(response.results.length, same(1));

    verify(articlesService.getMostViewedArticles()).called(1);
  });

  test('should get list of ArticlesEntity when fetching most shared articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(articlesService.getMostSharedArticles())
        .thenAnswer((_) async => articlesResponseModel);
    when(endpointProvider.getMostSharedArticles())
        .thenAnswer((_) async => articlesResponseModel);

    final ArticlesResponseModel response =
        await articlesService.getMostSharedArticles();

    expect(response, same(articlesResponseModel));
    expect(response.results.length, same(1));

    verify(articlesService.getMostSharedArticles()).called(1);
  });

  test('should configure dependencies when constructing start services class',
      () async {

    GetIt.instance.unregister(instance: endpointProvider);
    remoteServices.init();

    expect(GetIt.instance.isRegistered<EndpointProvider>(), isTrue);
  });
}
