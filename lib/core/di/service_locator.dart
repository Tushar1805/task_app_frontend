import 'package:get_it/get_it.dart';
import 'package:task_app/core/localization/language_cubit.dart';
import 'package:task_app/core/resources/app_storage.dart';
import 'package:task_app/core/theme/theme_cubit.dart';
import 'package:task_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:task_app/presentation/auth/repo/auth_repo.dart';

final sl = GetIt.I;

void setupServiceLocator() async {
  //* Repositories
  sl.registerFactory<SecureStorage>(SecureStorage.new);
  sl.registerFactory<AuthRepository>(AuthRepository.new);

  //* Cubits
  sl.registerLazySingleton<ThemeCubit>(
    ThemeCubit.new,
  );
  sl.registerLazySingleton<LanguageCubit>(
    LanguageCubit.new,
  );
  sl.registerSingleton<AuthCubit>(
    AuthCubit(sl<AuthRepository>()),
  );
}
