import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calmi/core/result/result.dart';
import 'package:calmi/data/model/haru.dart';

part 'haru_state.freezed.dart';

@freezed
abstract class HaruState with _$HaruState {
  const factory HaruState({
    @Default(Result<List<Haru>>.success([])) Result<List<Haru>> haru,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _HaruState;
}
