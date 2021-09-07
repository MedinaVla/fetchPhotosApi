import 'package:photos/src/domain/entities/photo.dart';

abstract class IRemoteDataSource {
  Future<List<Photo>> fetchPhotos();
}
