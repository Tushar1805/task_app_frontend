import 'package:task_app/core/resources/app_api.dart';
import 'package:task_app/datasource/base_repository.dart';
import 'package:task_app/datasource/network/api_call_type.dart';
import 'package:task_app/presentation/auth/model/user_details_response.dart';

class AuthRepository extends BaseRepository {
  Future<UserDetailsResponseModel?> getUserDetails({
    required final String accessToken,
    required final String lang,
  }) async {
    final responseData = await fetchData(
      apiCallType: ApiCallType.post,
      accessToken: accessToken,
      apiUrl: Api.getUserDetailsUrl,
      requestModel: {
        'lang': lang,
      },
    );

    return UserDetailsResponseModel.fromJson(
      responseData as Map<String, dynamic>?,
    );
  }
}
