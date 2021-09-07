import 'package:equatable/equatable.dart';

abstract class Photo extends Equatable {
  late final int albumId;
  late final int id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;
}
