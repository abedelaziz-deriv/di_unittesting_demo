import 'package:data/data.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:di_unittesting_demo/core/enums.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_cubit.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mock_article_data_model.dart';
import 'articles_cubit_test.mocks.dart';

@GenerateMocks([ArticlesRepository])
void main() {
  late ArticlesRepository articlesRepository;

  setUpAll(() {
    articlesRepository = MockArticlesRepository();

    GetIt.instance.registerSingleton(articlesRepository);
  });

  test(
      'should emit ArticlesLoadedState when getArticles is called and content type is mostEmailed',
      () {
    when(articlesRepository.getMostEmailedArticles())
        .thenAnswer((_) async => mockArticles);

    final ArticlesCubit cubit = ArticlesCubit()
      ..getArticles(type: ContentType.mostEmailed);

    expect(
        cubit.stream,
        emitsInOrder(<ArticlesState>[
          ArticlesLoadedState(mockArticles),
        ]));
  });

  test(
      'should emit ArticlesLoadedState when getArticles is called and content type is mostShared',
      () {
    when(articlesRepository.getMostSharedArticles())
        .thenAnswer((_) async => mockArticles);

    final ArticlesCubit cubit = ArticlesCubit()
      ..getArticles(type: ContentType.mostShared);

    expect(
        cubit.stream,
        emitsInOrder(<ArticlesState>[
          //const ArticlesLoadingState(),
          ArticlesLoadedState(mockArticles),
        ]));
  });

  test(
      'should emit ArticlesLoadedState when getArticles is called and content type is mostViewed',
      () {
    when(articlesRepository.getMostViewedArticles())
        .thenAnswer((_) async => mockArticles);

    final ArticlesCubit cubit = ArticlesCubit()
      ..getArticles(type: ContentType.mostViewed);

    expect(
        cubit.stream,
        emitsInOrder(<ArticlesState>[
          //const ArticlesLoadingState(),
          ArticlesLoadedState(mockArticles),
        ]));
  });

  blocTest<ArticlesCubit, ArticlesState>(
    'should emit [ArticlesLoadingState] as first state whenever getArticles is called',
    setUp: () {
      when(articlesRepository.getMostEmailedArticles())
          .thenAnswer((_) async => mockArticles);
    },
    build: () => ArticlesCubit(),
    act: (ArticlesCubit cubit) =>
        cubit.getArticles(type: ContentType.mostEmailed),
    expect: () => [
      isA<ArticlesLoadingState>(),
      isA<ArticlesLoadedState>(),
    ],
  );
}
