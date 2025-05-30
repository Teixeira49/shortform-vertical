import 'dart:convert';

import 'package:venetiktok/src/modules/profile/data/data_source/remote/profile_api.dart';
import 'package:venetiktok/src/modules/profile/data/data_source/remote/profile_endpoints.dart';
import '../../models/models.dart';

import '../../../../../shared/core/exceptions/app_exception.dart';
import '../../../../../shared/features/models/models/app_api_rest_response_model.dart';
import '../../../../../shared/features/utils/http_manager.dart';
import '../../../../../shared/features/utils/http_operation.dart';

class ProfileApiRest implements IProfileApi {
  ProfileApiRest({
    required String apiUrl,
    HttpManager? client,
  })  : _apiUrl = apiUrl,
        _client = client ?? HttpManager();

  final HttpManager _client;
  final String _apiUrl;

  @override
  Future<void> deleteAccount({required DeleteAccountParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + ProfileEndpoints.deleteAccount(params.toString()),
        method: HttpOperation.delete,
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

  @override
  Future<List<VideoModel>> getVideosHistory({required FeedVideoParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _apiUrl + ProfileEndpoints.history,
        method: HttpOperation.get,
        //body: params.toMap(),
      );

      //final data = AppApiRestResponseModel.fromJson(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return (json.decode(response.data) as List) // Change in a future version
            .map((e) => VideoModel.fromMap(e))
            .toList();
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      rethrow;
    }
  }
}
