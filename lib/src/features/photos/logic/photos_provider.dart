import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:network_manager/network_manager.dart';
import 'package:photos/photos.dart';
import 'package:riverpod_api/src/core/env/environment_config.dart';

import 'photos_state.dart';

part 'photos_state_notifier.dart';

/// Provider to use the PhotosStateNotifier
final photosNotifierProvider =
    StateNotifierProvider<PhotosNotifier, PhotosState>(
  (ref) => PhotosNotifier(fetchPhotos: ref.watch(fetchPhotosProvider)),
);

/// Repositories Providers
final photosRepositoryProvider =
    Provider<IPhotosRepository>((_) => PhotosRepository(
        networkManager: NetworkManager(DataConnectionChecker()),
        remoteDataSource: HttpDataSources(
          client: Client(),
          url: '${EnvironmentConfig.apiUrl}/photos',
        )));

/// Use Cases Providers
final fetchPhotosProvider = Provider<FetchPhotos>((ref) {
  final repository = ref.watch(photosRepositoryProvider);
  return FetchPhotos(repository: repository);
});
