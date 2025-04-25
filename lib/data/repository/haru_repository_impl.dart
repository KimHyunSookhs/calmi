import 'package:calmi/core/result/result.dart';
import 'package:calmi/data/data_source/haru_data_source.dart';
import 'package:calmi/data/dto/haru_dto.dart';
import 'package:calmi/data/mapper/haru_mapper.dart';
import 'package:calmi/data/model/haru.dart';
import 'package:calmi/domain/repository/haru_repository.dart';

class HaruRepositoryImpl implements HaruRepository {
  final HaruDataSource haruDataSource;

  HaruRepositoryImpl({required this.haruDataSource});

  @override
  Future<Result<List<Haru>>> getHaru() async {
    try {
      final List<HaruDto> dto = await haruDataSource.getHaruList();
      final List<Haru> models = dto.map((e) => e.toHaru()).toList();
      return Result.success(models);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
