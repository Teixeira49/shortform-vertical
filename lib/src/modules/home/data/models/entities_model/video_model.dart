import '../../../domain/entities/entities.dart';

class VideoModel extends Video {
  VideoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnailUrl,
    required super.videoUrl,
    required super.duration,
    required super.uploadDate,
  });

  factory VideoModel.fromEntity(Video entity) {
    return VideoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      thumbnailUrl: entity.thumbnailUrl,
      videoUrl: entity.videoUrl,
      duration: entity.duration,
      uploadDate: entity.uploadDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'duration': duration,
      'uploadDate': uploadDate.toIso8601String(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      videoUrl: map['videoUrl'] as String,
      duration: map['duration'] as int,
      uploadDate: DateTime.parse(map['uploadDate'] as String),
    );
  }
}
