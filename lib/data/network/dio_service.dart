import 'package:dio/dio.dart';
import 'package:cinex/data/config/tmdb.dart';

class DioService {
  static BaseOptions options = BaseOptions(
      baseUrl: TMDB.BASE_URL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      queryParameters: {'language': 'vi'},
      headers: headers);
  static Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${TMDB.TOKEN}'
  };
}
