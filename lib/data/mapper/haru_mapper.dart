import 'package:calmi/data/dto/haru_dto.dart';
import 'package:calmi/data/model/haru.dart';

extension HaruMapper on HaruDto {
  Haru toHaru() {
    return Haru(
        timeOfDay: timeOfDay ?? '',
        content: content ?? '',
        isChecked: isChecked ?? false);
  }
}
