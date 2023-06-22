import 'package:get_it/get_it.dart';
import 'package:remote/src/api/endpoint_provider.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

import '../di/injector.dart';

class RemoteServices {
  void init() {
    configureDependencies(GetIt.instance);
  }
}

class ArticlesService {
  Future<ArticlesResponseModel> getMostEmailedArticles() async =>
      GetIt.instance<EndpointProvider>().getMostEmailedArticles();

  Future<ArticlesResponseModel> getMostSharedArticles() async =>
      GetIt.instance<EndpointProvider>().getMostSharedArticles();

  Future<ArticlesResponseModel> getMostViewedArticles() async =>
      GetIt.instance<EndpointProvider>().getMostViewedArticles();
}
