import 'package:venetiktok/src/modules/home/data/data_source/remote/media_api.dart';
import 'package:venetiktok/src/modules/home/data/models/entities_model/video_model.dart';
import 'package:venetiktok/src/modules/home/data/models/params/feed_video_params_model.dart';
import 'package:venetiktok/src/shared/features/utils/http_manager.dart';

import '../../../../../shared/features/models/models/app_api_rest_response_model.dart';
import '../../../../../shared/features/utils/http_operation.dart';
import 'media_endpoints.dart';

class MediaApiRest implements IMediaApi {

  MediaApiRest({
    required String baseUrl,
    HttpManager? client,
  }) : _baseUrl = baseUrl,
       _client = client ?? HttpManager();

  final HttpManager _client;
  final String _baseUrl;

  @override
  Future<List<VideoModel>> getVideos({required FeedVideoParamsModel params}) async {
    try {
      final response = await _client.request(
        endpoint: _baseUrl + MediaEndpoints.feed,
        method: HttpOperation.get,
        body: params.toMap(),
      );

      final data = AppApiRestResponseModel.fromJson(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
          return (data.data as List)
              .map((e) => VideoModel.fromMap(e))
              .toList();
      }
      throw Exception(data.message);
    } catch (e) {
      rethrow;
    }
  }


}