import 'package:di_unittesting_demo/core/enums.dart';
import 'package:di_unittesting_demo/features/articles/articles_screen.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_cubit.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_state.dart';
import 'package:di_unittesting_demo/keys/articles/articles_screen_keys.dart';
import 'package:di_unittesting_demo/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_article_data_model.dart';
import 'articles_screen_test.mocks.dart';

@GenerateMocks([ArticlesCubit])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ArticlesCubit articlesCubit;

  setUp(() {
    articlesCubit = MockArticlesCubit();

    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(const ArticlesInitialState()));
    when(articlesCubit.state).thenReturn(const ArticlesInitialState());
  });

  Widget articlesScreenWidget(ContentType type) {
    MaterialPageRoute test = MaterialPageRoute(
        builder: (BuildContext context) => const ArticlesScreen(),
        settings: RouteSettings(name: articlesScreen, arguments: type));
    return MultiBlocProvider(
        providers: [
          BlocProvider<ArticlesCubit>(
            create: (_) => articlesCubit,
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return test;
          },
        ));
  }

  testWidgets('should display articles screen', (tester) async {
    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenKey), findsOneWidget);
  });

  testWidgets(
      'should display progress indicator when ArticlesLoadingState is emit',
      (tester) async {
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(const ArticlesLoadingState()));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pump();
    expect(find.byKey(articlesScreenLoadingKey), findsOneWidget);
  });

  testWidgets('should display empty view when ArticlesLoadingState is emit',
      (tester) async {
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(const ArticlesInitialState()));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();
    expect(find.byKey(articlesScreenEmptyViewKey), findsOneWidget);
  });

  testWidgets(
      'should display list of articles when ArticlesLoadedState is emit',
      (tester) async {
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(ArticlesLoadedState(mockArticles)));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();
    expect(find.byKey(articlesScreenListKey), findsOneWidget);
  });

  testWidgets(
      'should display placeholder image when ArticlesLoadedState is emit and an image url is empty',
      (tester) async {
    when(articlesCubit.stream).thenAnswer(
        (_) => Stream.value(ArticlesLoadedState(mockArticlesWithNoImages)));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenListKey), findsOneWidget);
    expect(find.byKey(articlesScreenImagePlaceholderKey),
        findsNWidgets(mockArticlesWithNoImages.length));
  });

  testWidgets('should call to fetch articles when list is pulled to refresh',
      (tester) async {
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(ArticlesLoadedState(mockArticles)));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenListKey), findsOneWidget);

    await tester.fling(
        find.byKey(articlesScreenListKey), const Offset(0.0, 300.0), 1000.0);
    await tester.pump();

    await tester
        .pump(const Duration(seconds: 1)); // finish the scroll animation
    await tester.pump(
        const Duration(seconds: 1)); // finish the indicator settle animation
    await tester.pump(
        const Duration(seconds: 1)); // finish the indicator hide animation

    verify(articlesCubit.getArticles(type: ContentType.mostEmailed)).called(1);
  });

  testWidgets('should call to open a browser when an article is tapped',
      (tester) async {
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(ArticlesLoadedState(mockArticles)));

    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenListKey), findsOneWidget);

    await tester.tap(find.byKey(articlesScreenOpenBrowserKey(0)));

    verify(articlesCubit.launchURL(mockArticles.first.url)).called(1);
  });

  testWidgets('should display Most Emailed title when type is mostEmailed',
      (tester) async {
    await tester.pumpWidget(articlesScreenWidget(ContentType.mostEmailed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenKey), findsOneWidget);
    expect(find.text('Most Emailed'), findsOneWidget);
  });

  testWidgets('should display Most Viewed title when type is mostViewed',
      (tester) async {
    await tester.pumpWidget(articlesScreenWidget(ContentType.mostViewed));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenKey), findsOneWidget);
    expect(find.text('Most Viewed'), findsOneWidget);
  });

  testWidgets('should display Most Shared title when type is mostShared',
      (tester) async {
    await tester.pumpWidget(articlesScreenWidget(ContentType.mostShared));
    await tester.pumpAndSettle();

    expect(find.byKey(articlesScreenKey), findsOneWidget);
    expect(find.text('Most Shared'), findsOneWidget);
  });
}
