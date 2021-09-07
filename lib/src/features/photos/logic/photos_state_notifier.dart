part of 'photos_provider.dart';
// TODO: Implement Photos StateNotifier

/// Defines all the Photos logic the app will use
class PhotosNotifier extends StateNotifier<PhotosState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state

  final FetchPhotos _fetchPhotos;

  PhotosNotifier({required FetchPhotos fetchPhotos, PhotosState? initialState})
      : _fetchPhotos = fetchPhotos,
        super(initialState ?? PhotosState.initial());

  void reset() => state = PhotosState.initial();

  Future<void> fetchPhotos() async {
    state = PhotosState.loading();
    final result = await _fetchPhotos();
    result.fold(
      (error) => state = PhotosState.error(error.toString()),
      (photos) => state = PhotosState.data(photos: photos),
    );
  }
}
