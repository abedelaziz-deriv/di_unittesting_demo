// Mocks generated by Mockito 5.4.2 from annotations
// in data/test/src/source/data_source_factory_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data/src/models/articles/articles_data_model.dart' as _i5;
import 'package:data/src/source/local_data_source.dart' as _i6;
import 'package:data/src/source/remote_data_source.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:remote/remote.dart' as _i2;

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

class _FakeArticlesService_0 extends _i1.SmartFake
    implements _i2.ArticlesService {
  _FakeArticlesService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i3.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ArticlesService get articlesService => (super.noSuchMethod(
        Invocation.getter(#articlesService),
        returnValue: _FakeArticlesService_0(
          this,
          Invocation.getter(#articlesService),
        ),
      ) as _i2.ArticlesService);
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
  _i4.Future<List<_i5.ArticlesDataModel>> getMostViewedArticles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMostViewedArticles,
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
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i6.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }
}