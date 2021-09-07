import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photos/photos.dart';

part 'photos_state.freezed.dart';

extension PhotosGetters on PhotosState {
  bool get isLoading => this is _Loading;
}

@freezed
abstract class PhotosState with _$PhotosState {
  /// Data is present state
  const factory PhotosState.data({required List<Photo> photos}) = _Data;

  /// Initial/default state
  const factory PhotosState.initial() = _Initial;

  /// Data is loading state
  const factory PhotosState.loading() = _Loading;

  /// Error when loading data state
  const factory PhotosState.error([String? message]) = _Error;
}
