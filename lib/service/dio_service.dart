import 'package:dio/dio.dart';
import 'package:cinex/provider/tmdb.dart';

class DioService {
  late Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
          baseUrl: TMDB.BASE_URL,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          queryParameters: {'language': 'vi'},
          headers: headers),
    );
  }
  Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${TMDB.TOKEN}'
  };

  // GET request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      print('GET $endpoint request error: $e');
      rethrow;
    }
  }
}
