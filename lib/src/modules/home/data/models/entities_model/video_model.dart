import '../../../domain/entities/entities.dart';
import '../models.dart';

class VideoModel extends Video {
  VideoModel({
    required super.assetName,
    required super.images,
    required super.videos,
    required super.metadata,
  });

  factory VideoModel.fromEntity(Video entity) {
    return VideoModel(
      assetName: entity.assetName,
      images: entity.images,
      videos: entity.videos,
      metadata: entity.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Asset Name': assetName,
      'Images': VideoImageModel.fromEntity(images).toMap(),
      'Videos': VideoFormatModel.fromEntity(videos).toMap(),
      'Metadata': MetadataModel.fromEntity(metadata).toMap(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
        assetName: map['Asset Name'] as String,
        images: VideoImageModel.fromMap(map['Images'] as Map<String, dynamic>),
        videos: VideoFormatModel.fromMap(map['Videos'] as Map<String, dynamic>),
        metadata: MetadataModel.fromMap(map['Metadata'] as Map<String, dynamic>),

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
}
