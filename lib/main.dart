import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';
import 'di/injector.dart';
import 'features/articles/states/articles_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ArticlesCubit())],
        child: const App())),
    blocObserver: CubitObserver(),
  );
}
