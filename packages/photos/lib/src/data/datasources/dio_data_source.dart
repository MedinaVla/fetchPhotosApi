import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:photos/photos.dart';
import 'remote_data_source.dart';
import 'package:http/http.dart' as http;

class DioDataSources implements IRemoteDataSource {
  DioDataSources({required String url, required Dio client})
      : _url = url,
        _client = client;

  final String _url;
  final Dio _client;

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    try {
      print('--------------------');
      print(_url);
      // final result = await _client.get(_url);
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        List<PhotoModel> photos = parsePhotos(response.body);

        return photos;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  List<PhotoModel> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    print(parsed);

    return parsed.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
  }

  // List<PhotoModel> parsePhotos(String responseBody) {
  //   print('\++++++++++++++++++');
  //   (json.decode(responseBody) as List<dynamic>).map((e) => print(e));
  //   var photos = (json.decode(responseBody) as List<dynamic>)
  //       .map((e) => PhotoModel.fromJson(e))
  //       .toList();
  //   ;
  //   print(photos.first);
  //   return photos;
  // }
}
