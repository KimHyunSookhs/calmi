import 'package:get_it/get_it.dart';

import '../../data/data_source/haru_data_source.dart';
import '../../data/data_source/haru_data_source_impl.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../data/repository/haru_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/haru_repository.dart';
import '../../domain/use_case/get_haru_use_case.dart';
import '../../domain/use_case/random_pick_use_case.dart';
import '../../domain/use_case/sign_in_use_case.dart';
import '../../domain/use_case/signup_use_case.dart';
import '../../presentation/haru/haru_view_model.dart';
import '../../presentation/sign_in_screen/sign_in_view_model.dart';
import '../../presentation/signup_screen/sign_up_view_model.dart';


final getIt = GetIt.instance;

void diSetUp() {
  //DataSource
  getIt.registerSingleton<HaruDataSource>(HaruDataSourceImpl());

  //Repository
  getIt.registerSingleton<HaruRepository>(
      HaruRepositoryImpl(haruDataSource: getIt()));
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //UseCase
  getIt.registerSingleton(GetHaruUseCase(haruRepository: getIt()));
  getIt.registerSingleton(RandomPickUseCase(haruRepository: getIt()));
  getIt.registerSingleton(SignupUseCase(authRepository: getIt()));
  getIt.registerSingleton(SignInUseCase(authRepository: getIt()));

  //ViewModel
  getIt.registerFactory<HaruViewModel>(
      () => HaruViewModel(randomPickUseCase: getIt()));
  getIt.registerFactory<SignUpViewModel>(
      () => SignUpViewModel(signupUseCase: getIt()));
  getIt.registerFactory<SignInViewModel>(
      () => SignInViewModel(useCase: getIt()));
}
