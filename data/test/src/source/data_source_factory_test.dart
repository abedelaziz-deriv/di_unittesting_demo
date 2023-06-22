import 'package:data/src/source/data_source.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:data/src/source/local_data_source.dart';
import 'package:data/src/source/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'data_source_factory_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  late DataSourceFactory dataSourceFactory;

  late RemoteDataSource remoteDataSource;
  late LocalDataSource localDataSource;

  setUpAll(() {
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();

    dataSourceFactory = DataSourceFactory(
        remoteDataSource: remoteDataSource, localDataSource: localDataSource);
  });

  test('should return remote data source by default', () {
    final DataSource dataSource = dataSourceFactory.getDataSource();
    expect(dataSource, remoteDataSource);
  });

  test('should return remote data source when force is passed as true', () {
    final DataSource dataSource =
        dataSourceFactory.getDataSource(forceRefresh: true);
    expect(dataSource, remoteDataSource);
  });

  test('should return remote data source when isLocal is passed as false', () {
    final DataSource dataSource =
        dataSourceFactory.getDataSource(isLocal: false);
    expect(dataSource, remoteDataSource);
  });

  test('should return local data source when isLocal is passed as true', () {
    final DataSource dataSource =
        dataSourceFactory.getDataSource(isLocal: true);
    expect(dataSource, localDataSource);
  });

  test(
      'should return local data source when force is passed as false and isLocal as true',
      () {
    final DataSource dataSource =
        dataSourceFactory.getDataSource(forceRefresh: false, isLocal: true);
    expect(dataSource, localDataSource);
  });
}
