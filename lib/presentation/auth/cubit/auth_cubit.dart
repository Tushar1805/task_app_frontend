

import '../../../core/di/service_locator.dart';
import '../../../core/resources/app_keys.dart';
import '../../../core/resources/app_storage.dart';
import '../../../datasource/basecubit/base_cubit.dart';
import '../repo/auth_repo.dart';
import '../states/auth_states.dart';

class AuthCubit extends BaseCubit {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super();
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