import '../../../domain/entities/entities.dart';

class MetadataModel extends Metadata {
  MetadataModel({
    required super.title,
    required super.actors,
    required super.directors,
    required super.rating,
    required super.synopsis,
    required super.availDate,
    required super.expDate,
  });

  factory MetadataModel.fromEntity(Metadata entity) {
    return MetadataModel(
      title: entity.title,
      actors: entity.actors,
      directors: entity.directors,
      rating: entity.rating,
      synopsis: entity.synopsis,
      availDate: entity.availDate,
      expDate: entity.expDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'Actors': actors,
      'Directors': directors,
      'Rating': rating,
      'Synopsis': synopsis,
      'Avail Date': availDate,
      'Exp Date': expDate,
    };
  }

  factory MetadataModel.fromMap(Map<String, dynamic> map) {
    return MetadataModel(
      title: map['Title'] as String,
      actors: map['Actors'] as String,
      directors: map['Directors'] as String,
      rating: map['Rating'] as String,
      synopsis: map['Synopsis'] as String,
      availDate: map['Avail Date'] as String,
      expDate: map['Exp Date'] as String,
    );
  }

  @override
  String toString() {
    return 'MetadataModel(title: $title, actors: $actors, directors: $directors, rating: $rating, synopsis: $synopsis, availDate: $availDate, expDate: $expDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MetadataModel &&
        other.title == title &&
        other.actors == actors &&
        other.directors == directors &&
        other.rating == rating &&
        other.synopsis == synopsis &&
        other.availDate == availDate &&
        other.expDate == expDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        actors.hashCode ^
        directors.hashCode ^
        rating.hashCode ^
        synopsis.hashCode ^
        availDate.hashCode ^
        expDate.hashCode;
  }

  MetadataModel copyWith({
    String? title,
    String? actors,
    String? directors,
    String? rating,
    String? synopsis,
    String? availDate,
    String? expDate,
  }) {
    return MetadataModel(
      title: title ?? this.title,
      actors: actors ?? this.actors,
      directors: directors ?? this.directors,
      rating: rating ?? this.rating,
      synopsis: synopsis ?? this.synopsis,
      availDate: availDate ?? this.availDate,
      expDate: expDate ?? this.expDate,
    );
  }

  Metadata toEntity() {
    return Metadata(
      title: title,
      actors: actors,
      directors: directors,
      rating: rating,
      synopsis: synopsis,
      availDate: availDate,
      expDate: expDate,
    );
  }
}
