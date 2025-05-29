import '../../../../variables/constants/constants.dart';
import '../../models/models.dart';
import '../../models/models/app_api_rest_response_model.dart';
import '../../utils/http_manager.dart';
import 'user_api.dart';
import 'user_endpoints.dart';
import 'dart:convert';

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

    // NOTE: Hardcode for demo purposes
    String complete = '';
    if (token == "brocolisoftware@gmail.com") {
      complete += '1.json';
    } else if (token == "andrea.lopez@gmail.com") {
      complete += '2.json';
    } else if (token == "alana.garcia@gmail.com") {
      complete += '3.json';
    }

    try {
      final response = await _client.request(
        endpoint: _apiUrl + UserEndpoints.getCurrentUser + complete,
        //customHeader: {
        //  HttpConstants.tokenHeader: 'Bearer $token',
        //},
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (response.statusCode == 200) {
        return UserModel.fromMap(json.decode(response.data)); // Chance in a upper version
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
