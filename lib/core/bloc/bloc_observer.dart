// coverage:ignore-file
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// An observer for blocs and cubits state change
class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log('${bloc.runtimeType} $change');

    super.onChange(bloc, change);
  }
}
