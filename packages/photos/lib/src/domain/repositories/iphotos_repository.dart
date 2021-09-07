import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:photos/src/domain/entities/photo.dart';

/// Repository interface for photos
abstract class IPhotosRepository {
  Future<Either<Failure, List<Photo>>> fetchPhotos();
}
