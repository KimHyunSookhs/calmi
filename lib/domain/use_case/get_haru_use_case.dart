import 'package:calmi/core/result/result.dart';
import 'package:calmi/data/model/haru.dart';
import 'package:calmi/domain/repository/haru_repository.dart';

class GetHaruUseCase {
  final HaruRepository haruRepository;

  GetHaruUseCase({required this.haruRepository});

  Future<Result<List<Haru>>> execute() async {
    final haruResult = await haruRepository.getHaru();

    if (haruResult case Error(:final e)) {
      return Result.error(e);
    }
    final haru = (haruResult as Success).data;

    return switch (haruResult) {
      Success() => Result.success(haru),
      Error(:final e) => Result.error(e),
    };
  }
}
