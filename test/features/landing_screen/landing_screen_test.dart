import 'package:di_unittesting_demo/features/articles/states/articles_cubit.dart';
import 'package:di_unittesting_demo/features/articles/states/articles_state.dart';
import 'package:di_unittesting_demo/features/landing_screen/landing_screen.dart';
import 'package:di_unittesting_demo/keys/articles/articles_screen_keys.dart';
import 'package:di_unittesting_demo/keys/landing/landing_screen_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../wrapper_widget.dart';
import '../articles/articles_screen_test.mocks.dart';

void main() {
  late ArticlesCubit articlesCubit;

  setUpAll(() {
    articlesCubit = MockArticlesCubit();
    when(articlesCubit.stream)
        .thenAnswer((_) => Stream.value(const ArticlesInitialState()));
    when(articlesCubit.state).thenReturn(const ArticlesInitialState());
  });

  testWidgets('should display landing screen', (tester) async {
    await tester.pumpWidget(const WrapperWidget(child: LandingScreen()));
    await tester.pumpAndSettle();

    expect(find.byKey(landingScreenKey), findsOneWidget);
  });

  testWidgets(
      'should navigate out of landing screen when most emailed button is pressed',
      (tester) async {
    await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<ArticlesCubit>(
        create: (_) => articlesCubit,
      ),
    ], child: const WrapperWidget(child: LandingScreen())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(landingScreenMostEmailedButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(landingScreenKey), findsNothing);
    expect(find.byKey(articlesScreenKey), findsOneWidget);
  });

  testWidgets(
      'should navigate out of landing screen when most viewed button is pressed',
      (tester) async {
    await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<ArticlesCubit>(
        create: (_) => articlesCubit,
      ),
    ], child: const WrapperWidget(child: LandingScreen())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(landingScreenMostViewedButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(landingScreenKey), findsNothing);
    expect(find.byKey(articlesScreenKey), findsOneWidget);
  });

  testWidgets(
      'should navigate out of landing screen when most shared button is pressed',
      (tester) async {
    await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<ArticlesCubit>(
        create: (_) => articlesCubit,
      ),
    ], child: const WrapperWidget(child: LandingScreen())));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(landingScreenMostSharedButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(landingScreenKey), findsNothing);
    expect(find.byKey(articlesScreenKey), findsOneWidget);
  });
}
