import 'dart:convert';

import 'package:venetiktok/src/modules/search/data/data_source/remote/search_api.dart';
import 'package:venetiktok/src/shared/features/utils/http_manager.dart';

import '../../../../../shared/features/utils/http_operation.dart';
import '../../models/models.dart';
import 'search_endpoints.dart';

class SearchApiRest implements ISearchApi {

  SearchApiRest({
    required String apiUrl,
    HttpManager? client,
  }) : _baseUrl = apiUrl,
       _client = client ?? HttpManager();

  final HttpManager _client;
  final String _baseUrl;

  @override
  Future<List<VideoModel>> getRecommendedVideos({required FeedVideoParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _baseUrl + SearchEndpoints.feed,
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