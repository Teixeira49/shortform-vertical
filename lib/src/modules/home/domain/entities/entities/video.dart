import 'package:venetiktok/src/modules/home/domain/entities/entities/video_metadata.dart';

import 'media_data.dart';

class Video {
  final String assetName;
  final VideoImage images;
  final VideoFormat videos;
  final Metadata metadata;
  final VideoSubtitle subtitle;

  Video({
    required this.assetName,
    required this.images,
    required this.videos,
    required this.metadata,
    required this.subtitle,
  });

  String get subtitleUrl => subtitle.url;
}

class VideoImage {
  final MediaData images;

  VideoImage({required this.images});
}

class VideoFormat {
  final MediaData hlsUrl;
  final MediaData dashUrl;

  VideoFormat({required this.hlsUrl, required this.dashUrl});
}

class VideoSubtitle {
  final String url;

  VideoSubtitle({required this.url});
}