

import '../../core/result/result.dart';
import '../../data/model/haru.dart';

abstract interface class HaruRepository {
  Future<Result<List<Haru>>> getHaru();
}
