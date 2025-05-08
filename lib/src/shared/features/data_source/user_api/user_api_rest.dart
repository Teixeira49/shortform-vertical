import '../../../../variables/constants/constants.dart';
import '../../models/models.dart';
import '../../models/models/app_api_rest_response_model.dart';
import '../../utils/http_manager.dart';
import 'user_api.dart';
import 'user_endpoints.dart';

class UserApiRest implements IUserApi {
  UserApiRest({
    required String apiUrl,
    HttpManager? client,
  })  : _apiUrl = apiUrl,
        _client = client ?? HttpManager();

  final HttpManager _client;
  final String _apiUrl;

  @override
  Future<UserModel?> getCurrentUser({required String token}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + UserEndpoints.getCurrentUser,
        customHeader: {
          HttpConstants.tokenHeader: 'Bearer $token',
        },
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (response.statusCode == 200) {
        return UserModel.fromMap(data.data);
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
