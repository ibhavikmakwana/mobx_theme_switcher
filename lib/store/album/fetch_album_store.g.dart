// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_album_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FetchAlbumStore on _FetchAlbumStore, Store {
  Computed<NetworkState> _$stateComputed;

  @override
  NetworkState get state =>
      (_$stateComputed ??= Computed<NetworkState>(() => super.state)).value;

  final _$_albumFutureAtom = Atom(name: '_FetchAlbumStore._albumFuture');

  @override
  ObservableFuture<List<Album>> get _albumFuture {
    _$_albumFutureAtom.context.enforceReadPolicy(_$_albumFutureAtom);
    _$_albumFutureAtom.reportObserved();
    return super._albumFuture;
  }

  @override
  set _albumFuture(ObservableFuture<List<Album>> value) {
    _$_albumFutureAtom.context.conditionallyRunInAction(() {
      super._albumFuture = value;
      _$_albumFutureAtom.reportChanged();
    }, _$_albumFutureAtom, name: '${_$_albumFutureAtom.name}_set');
  }

  final _$albumAtom = Atom(name: '_FetchAlbumStore.album');

  @override
  List<Album> get album {
    _$albumAtom.context.enforceReadPolicy(_$albumAtom);
    _$albumAtom.reportObserved();
    return super.album;
  }

  @override
  set album(List<Album> value) {
    _$albumAtom.context.conditionallyRunInAction(() {
      super.album = value;
      _$albumAtom.reportChanged();
    }, _$albumAtom, name: '${_$albumAtom.name}_set');
  }

  final _$fetchAlbumAsyncAction = AsyncAction('fetchAlbum');

  @override
  Future<void> fetchAlbum() {
    return _$fetchAlbumAsyncAction.run(() => super.fetchAlbum());
  }

  @override
  String toString() {
    final string = 'album: ${album.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
