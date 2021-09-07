import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';
import 'package:photos/photos.dart';

import '../repositories/iphotos_repository.dart';

class FetchPhotos {
  FetchPhotos({required IPhotosRepository repository})
      : _repository = repository;

  final IPhotosRepository _repository;

  /// Callable class method
  Future<Either<Failure, List<Photo>>> call() async =>
      await _repository.fetchPhotos();
}
