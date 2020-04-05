import 'package:mobx/mobx.dart';
import 'package:mobxthemeswitcher/model/Album.dart';
import 'package:mobxthemeswitcher/network/repository.dart';

part 'fetch_album_store.g.dart';

class FetchAlbumStore = _FetchAlbumStore with _$FetchAlbumStore;

abstract class _FetchAlbumStore with Store {
  final Repository _repository = Repository();

  @observable
  ObservableFuture<List<Album>> _albumFuture;

  @observable
  List<Album> album;

  @computed
  NetworkState get state {
    if (_albumFuture == null ||
        _albumFuture.status == FutureStatus.rejected) {
      return NetworkState.initial;
    }
    return _albumFuture.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.completed;
  }

  @action
  Future<void> fetchAlbum() async {
    _albumFuture = ObservableFuture(_repository.fetchAlbum());
    album = await _albumFuture;
  }
}

enum NetworkState {
  initial,
  loading,
  completed,
}
