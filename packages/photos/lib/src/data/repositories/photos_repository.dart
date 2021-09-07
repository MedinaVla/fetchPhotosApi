import 'package:errors/errors.dart';
import 'package:errors/src/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:network_manager/network_manager.dart';
import 'package:photos/photos.dart';
import 'package:photos/src/domain/entities/photo.dart';

import '../../domain/domain.dart';

/// Photos repository implementation
class PhotosRepository implements IPhotosRepository {
  /// Photos repository constructor
  PhotosRepository({
    required INetworkManager networkManager,
    required IRemoteDataSource remoteDataSource,
  })  : _networkManager = networkManager,
        _remoteDataSource = remoteDataSource;

  final INetworkManager _networkManager;
  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Photo>>> fetchPhotos() async {
    if (await _networkManager.isConnected) {
      try {
        final List<Photo> photos = await _remoteDataSource.fetchPhotos();
        return Right(photos);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
