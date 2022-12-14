// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsStore on _NewsStore, Store {
  late final _$articlesAtom =
      Atom(name: '_NewsStore.articles', context: context);

  @override
  List<Articles> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<Articles> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$fetchArticleAsyncAction =
      AsyncAction('_NewsStore.fetchArticle', context: context);

  @override
  Future<List<Articles>> fetchArticle() {
    return _$fetchArticleAsyncAction.run(() => super.fetchArticle());
  }

  @override
  String toString() {
    return '''
articles: ${articles}
    ''';
  }
}
