import 'package:flutter_project_template/core/di/service_locator.dart';
import 'package:flutter_project_template/core/resources/app_keys.dart';
import 'package:flutter_project_template/core/resources/app_storage.dart';
import 'package:flutter_project_template/datasource/basecubit/base_cubit.dart';
import 'package:flutter_project_template/presentation/auth/repo/auth_repo.dart';
import 'package:flutter_project_template/presentation/auth/states/auth_states.dart';

class AuthCubit extends BaseCubit {
  AuthCubit(this._authRepository) : super();
  final AuthRepository _authRepository;
  final storage = sl<SecureStorage>();

  Future<void> getUserDetails() async {
    try {
      emit(UserDetailsLoadingState('Getting User details'));
      final accessToken = await storage.readValue(accessTokenKey);
      final lang = await storage.readValue(languageCodeKey);
      final response = await _authRepository.getUserDetails(
        accessToken: accessToken ?? '',
        lang: lang ?? 'en',
      );
      emit(UserDetailsLoadedState(data: response));
    } catch (e) {
      handleExceptions(e);
    }
  }
}
