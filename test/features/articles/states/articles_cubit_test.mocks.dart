// Mocks generated by Mockito 5.4.2 from annotations
// in di_unittesting_demo/test/features/articles/states/articles_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data/src/models/articles/articles_data_model.dart' as _i5;
import 'package:data/src/repository/articles_repository.dart' as _i3;
import 'package:data/src/source/data_source_factory.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataSourceFactory_0 extends _i1.SmartFake
    implements _i2.DataSourceFactory {
  _FakeDataSourceFactory_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ArticlesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticlesRepository extends _i1.Mock
    implements _i3.ArticlesRepository {
  MockArticlesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataSourceFactory get dataSourceFactory => (super.noSuchMethod(
        Invocation.getter(#dataSourceFactory),
        returnValue: _FakeDataSourceFactory_0(
          this,
          Invocation.getter(#dataSourceFactory),
        ),
      ) as _i2.DataSourceFactory);
  @override
  _i4.Future<List<_i5.ArticlesDataModel>> getMostEmailedArticles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMostEmailedArticles,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ArticlesDataModel>>.value(
            <_i5.ArticlesDataModel>[]),
      ) as _i4.Future<List<_i5.ArticlesDataModel>>);
  @override
  _i4.Future<List<_i5.ArticlesDataModel>> getMostSharedArticles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMostSharedArticles,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ArticlesDataModel>>.value(
            <_i5.ArticlesDataModel>[]),
      ) as _i4.Future<List<_i5.ArticlesDataModel>>);
  @override
  _i4.Future<List<_i5.ArticlesDataModel>> getMostViewedArticles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMostViewedArticles,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ArticlesDataModel>>.value(
            <_i5.ArticlesDataModel>[]),
      ) as _i4.Future<List<_i5.ArticlesDataModel>>);
}