

import '../../../../../shared/core/exceptions/app_exception.dart';
import '../../../../../shared/features/models/models/app_api_rest_response_model.dart';
import '../../../../../shared/features/models/models/app_exception_model.dart';
import '../../../../../shared/features/utils/http_manager.dart';
import '../../../../../shared/features/utils/http_operation.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../models/models.dart';
import 'auth_api.dart';
import 'auth_endpoints.dart';

class AuthApiRest implements IAuthApi {
  AuthApiRest({
    required String apiUrl,
    HttpManager? client,
  })  : _apiUrl = apiUrl,
        _client = client ?? HttpManager();

  final HttpManager _client;
  final String _apiUrl;

  @override
  Future<String> signUpUser({required SignUpUserParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + AuthEndpoints.signUp,
        method: HttpOperation.post,
        body: params.toMap(),
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data.accessToken != null) {
          return data.accessToken!;
        }
      }

      throw AppException(message: data.message, code: data.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signInUser({required SignInUserParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + AuthEndpoints.signIn,
        method: HttpOperation.post,
        body: params.toMap(),
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (response.statusCode != 200 && response.statusCode != 201) {
        final message =
            AppExceptionModel.fromJson(response.data as String).message;
        throw AppException(message: message, code: response.statusCode);
      } else {
        if (data.accessToken != null && response.statusCode == 201) {
          return data.accessToken!;
        } else if (data.code == 404) {
          throw NeedToValidateEmailToLoginException(
            message: data.message,
            code: data.code,
          );
        } else {
          throw AppException(message: data.message, code: data.code);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + AuthEndpoints.forgotPassword,
        method: HttpOperation.post,
        body: {'email': email},
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (data.code != 200 && data.code != 201) {
        if (response.statusCode == 403) {
          throw EmailNotRegisteredException(
            message: data.message,
            code: data.code,
          );
        }
        throw AppException(message: data.message, code: data.code);
      }

      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + AuthEndpoints.signOut,
        method: HttpOperation.post,
      );

      final data = AppApiRestResponseModel.fromJson(response.data as String);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw AppException(message: data.message, code: data.code);
      }

      return;
    } catch (e) {
      rethrow;
    }
  }
}
