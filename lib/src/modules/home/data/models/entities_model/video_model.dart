import '../../../domain/entities/entities.dart';
import '../models.dart';

class VideoModel extends Video {
  VideoModel({
    required super.assetName,
    required super.images,
    required super.videos,
    required super.metadata,
    required super.subtitle,
  });

  factory VideoModel.fromEntity(Video entity) {
    return VideoModel(
      assetName: entity.assetName,
      images: entity.images,
      videos: entity.videos,
      metadata: entity.metadata,
      subtitle: entity.subtitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Asset Name': assetName,
      'Images': VideoImageModel.fromEntity(images).toMap(),
      'Videos': VideoFormatModel.fromEntity(videos).toMap(),
      'Metadata': MetadataModel.fromEntity(metadata).toMap(),
      'Subtitles': VideoSubtitleModel.fromEntity(subtitle).toMap(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      assetName: map['Asset Name'] as String,
      images: VideoImageModel.fromMap(map['Images'] as Map<String, dynamic>),
      videos: VideoFormatModel.fromMap(map['Videos'] as Map<String, dynamic>),
      metadata: MetadataModel.fromMap(map['Metadata'] as Map<String, dynamic>),
      subtitle: VideoSubtitleModel.fromMap(map['Subtitles'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'VideoModel(assetName: $assetName, images: $images, videos: $videos, metadata: $metadata, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoModel &&
        other.assetName == assetName &&
        other.images == images &&
        other.videos == videos &&
        other.metadata == metadata &&
        other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return assetName.hashCode ^
        images.hashCode ^
        videos.hashCode ^
        metadata.hashCode ^
        subtitle.hashCode;
  }

  VideoModel copyWith({
    String? assetName,
    VideoImage? images,
    VideoFormat? videos,
    Metadata? metadata,
    VideoSubtitle? subtitle,
  }) {
    return VideoModel(
      assetName: assetName ?? this.assetName,
      images: images ?? this.images,
      videos: videos ?? this.videos,
      metadata: metadata ?? this.metadata,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Video toEntity() {
    return Video(
      assetName: assetName,
      images: images,
      videos: videos,
      metadata: metadata,
      subtitle: subtitle,
    );
  }
}

class VideoImageModel extends VideoImage {
  VideoImageModel({required super.images});

  factory VideoImageModel.fromEntity(VideoImage entity) {
    return VideoImageModel(
      images: entity.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Image URL': MediaDataModel.fromEntity(images).toMap(),
    };
  }

  factory VideoImageModel.fromMap(Map<String, dynamic> map) {
    return VideoImageModel(
      images: MediaDataModel.fromMap(map['Image URL'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'VideoImageModel(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoImageModel && other.images == images;
  }

  @override
  int get hashCode => images.hashCode;

  VideoImageModel copyWith({
    MediaData? images,
  }) {
    return VideoImageModel(
      images: images ?? this.images,
    );
  }

  VideoImage toEntity() {
    return VideoImage(
      images: images,
    );
  }
}

class VideoFormatModel extends VideoFormat {
  VideoFormatModel({required super.hlsUrl, required super.dashUrl});

  factory VideoFormatModel.fromEntity(VideoFormat entity) {
    return VideoFormatModel(
      hlsUrl: entity.hlsUrl,
      dashUrl: entity.dashUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'HLS URL': MediaDataModel.fromEntity(hlsUrl).toMap(),
      'DASH URL': MediaDataModel.fromEntity(dashUrl).toMap(),
    };
  }

  factory VideoFormatModel.fromMap(Map<String, dynamic> map) {
    return VideoFormatModel(
      hlsUrl: MediaDataModel.fromMap(map['HLS URL'] as Map<String, dynamic>),
      dashUrl: MediaDataModel.fromMap(map['DASH URL'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'VideoFormatModel(hlsUrl: $hlsUrl, dashUrl: $dashUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoFormatModel &&
        other.hlsUrl == hlsUrl &&
        other.dashUrl == dashUrl;
  }

  @override
  int get hashCode => hlsUrl.hashCode ^ dashUrl.hashCode;

  VideoFormatModel copyWith({
    MediaData? hlsUrl,
    MediaData? dashUrl
  }) {
    return VideoFormatModel(
      hlsUrl: hlsUrl ?? this.hlsUrl,
      dashUrl: dashUrl ?? this.dashUrl,
    );
  }

  VideoFormat toEntity() {
    return VideoFormat(
      hlsUrl: hlsUrl,
      dashUrl: dashUrl,
    );
  }
}

class VideoSubtitleModel extends VideoSubtitle {

  VideoSubtitleModel({required super.url});

  factory VideoSubtitleModel.fromEntity(VideoSubtitle entity) {
    return VideoSubtitleModel(
      url: entity.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'URL': url,
    };
  }

  factory VideoSubtitleModel.fromMap(Map<String, dynamic> map) {
    return VideoSubtitleModel(
      url: map['URL'] as String,
    );
  }

  @override
  String toString() {
    return 'VideoSubtitleModel(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoSubtitleModel && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;

  VideoSubtitleModel copyWith({
    String? url,
  }) {
    return VideoSubtitleModel(
      url: url ?? this.url,
    );
  }

  VideoSubtitle toEntity() {
    return VideoSubtitle(
      url: url,
    );
  }
}
