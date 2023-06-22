import 'package:data/src/source/local_data_source.dart';
import 'package:injectable/injectable.dart';

import 'data_source.dart';
import 'remote_data_source.dart';

@singleton
class DataSourceFactory {
  DataSourceFactory({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  DataSource getDataSource({bool isLocal = false, bool forceRefresh = false}) {
    if (isLocal && !forceRefresh) {
      return getLocalDataSource();
    } else {
      return getRemoteDataSource();
    }
  }

  DataSource getRemoteDataSource() => remoteDataSource;

  DataSource getLocalDataSource() => localDataSource;
}
