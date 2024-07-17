import 'package:cinex/data/models/cast_model.dart';

abstract class CastRepository {
  Future<List<CastModel>> fetchCastMovie(int id);
  Future<List<CastModel>> fetchCastTV(int id);
}
