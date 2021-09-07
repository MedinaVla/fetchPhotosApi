import 'package:photos/src/domain/entities/photo.dart';

class PhotoModel implements Photo {
  PhotoModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  late final int albumId;
  @override
  late final int id;
  @override
  late final String title;
  @override
  late final String url;
  @override
  late final String thumbnailUrl;

  PhotoModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'] as int;
    id = json['id'] as int;
    title = json['title'] as String;
    url = json['url'] as String;
    thumbnailUrl = json['thumbnailUrl'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

  @override
  bool? get stringify => true;
}
