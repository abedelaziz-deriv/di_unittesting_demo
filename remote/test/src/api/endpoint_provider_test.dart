
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:remote/src/api/endpoint_provider.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

import '../../mock/mocks.dart';
import 'endpoint_provider_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late EndpointProvider endpointProvider;

  late Dio dio;

  setUpAll(() {
    dio = MockDio();

    endpointProvider = EndpointProvider(dio);
  });

  test(
      'should return ArticlesResponseModel when getMostEmailedArticles is called',
      () async {
    when(dio.get(mostPopularEmailed, queryParameters: queryParameters))
        .thenAnswer((_) async => mockResponse);

    final ArticlesResponseModel response =
        await endpointProvider.getMostEmailedArticles();

    expect(response.results.length, equals(mockMappedResponse.results.length));
    expect(
        response.results.first.id, equals(mockMappedResponse.results.first.id));
  });

  test(
      'should return ArticlesResponseModel when getMostSharedArticles is called',
      () async {
    when(dio.get(mostPopularShared, queryParameters: queryParameters))
        .thenAnswer((_) async => mockResponse);

    final ArticlesResponseModel response =
        await endpointProvider.getMostSharedArticles();

    expect(response.results.length, equals(mockMappedResponse.results.length));
    expect(
        response.results.first.id, equals(mockMappedResponse.results.first.id));
  });

  test(
      'should return ArticlesResponseModel when getMostViewedArticles is called',
      () async {
    when(dio.get(mostPopularViewed, queryParameters: queryParameters))
        .thenAnswer((_) async => mockResponse);

    final ArticlesResponseModel response =
        await endpointProvider.getMostViewedArticles();

    expect(response.results.length, equals(mockMappedResponse.results.length));
    expect(
        response.results.first.id, equals(mockMappedResponse.results.first.id));
  });
}
