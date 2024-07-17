import 'package:cinex/data/models/trailer_model.dart';

abstract class TrailerRepository {
  Future<TrailerModel?> fetchTrailer(int id);
}
