import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:http/http.dart';
import 'package:photos/photos.dart';
import 'package:photos/src/data/datasources/remote_data_source.dart';
import 'package:photos/src/domain/entities/photo.dart';

class HttpDataSources implements IRemoteDataSource {
  HttpDataSources({required String url, required Client client})
      : _url = url,
        _client = client;

  final String _url;
  final Client _client;

  @override
  Future<List<Photo>> fetchPhotos() async {
    try {
      print(_url);
      final result = await _client.get(Uri.parse(_url));

      if (result.statusCode == 200) {
        return parsePhotos(result.body);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  List<PhotoModel> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
  }
}
