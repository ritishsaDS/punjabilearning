
import 'package:flutter_punjabilearning/data/api/ApiHitter.dart';

class BaseRepository {
  final apiHitter = ApiHitter();
  final dio = ApiHitter.getDio();
}