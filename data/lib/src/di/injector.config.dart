// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/remote_services_provider.dart' as _i8;
import 'package:data/src/repository/articles_repository.dart' as _i7;
import 'package:data/src/source/data_source_factory.dart' as _i6;
import 'package:data/src/source/local_data_source.dart' as _i4;
import 'package:data/src/source/remote_data_source.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:remote/remote.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initDataGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiService = _$ApiService();
    gh.singleton<_i3.ArticlesService>(apiService.init());
    gh.singleton<_i4.LocalDataSource>(_i4.LocalDataSource());
    gh.singleton<_i5.RemoteDataSource>(
        _i5.RemoteDataSource(articlesService: gh<_i3.ArticlesService>()));
    gh.singleton<_i3.RemoteServices>(apiService.start());
    gh.singleton<_i6.DataSourceFactory>(_i6.DataSourceFactory(
      remoteDataSource: gh<_i5.RemoteDataSource>(),
      localDataSource: gh<_i4.LocalDataSource>(),
    ));
    gh.singleton<_i7.ArticlesRepository>(
        _i7.ArticlesRepository(dataSourceFactory: gh<_i6.DataSourceFactory>()));
    return this;
  }
}

class _$ApiService extends _i8.ApiService {}
