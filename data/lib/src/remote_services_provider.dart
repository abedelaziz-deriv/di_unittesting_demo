// coverage:ignore-file

import 'package:injectable/injectable.dart';
import 'package:remote/remote.dart';

@module
abstract class ApiService {
  @singleton
  RemoteServices start() {
    return RemoteServices()..init();
  }

  @singleton
  ArticlesService init() {
    return ArticlesService();
  }
}
