import '../../../domain/entities/entities.dart';

class MediaDataModel extends MediaData {
  MediaDataModel({
    required super.label,
    required super.url,
  });

  factory MediaDataModel.fromEntity(MediaData entity) {
    return MediaDataModel(
      label: entity.label,
      url: entity.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'url': url,
    };
  }

  factory MediaDataModel.fromMap(Map<String, dynamic> map) {
    return MediaDataModel(
      label: map['label'] as String,
      url: map['url'] as String,
    );
  }

  @override
  String toString() {
    return 'MediaDataModel(label: $label, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MediaDataModel && other.label == label && other.url == url;
  }

  @override
  int get hashCode => label.hashCode ^ url.hashCode;
}
