import 'package:calmi/data/dto/haru_dto.dart';

abstract interface class HaruDataSource {
  Future<List<HaruDto>> getHaruList();
}
