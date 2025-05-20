
import '../../entities/entities/entities.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.assetsName,
    required super.title,
    required super.actors,
    required super.directors,
    required super.rating,
    required super.synopsis,
    required super.availDate,
    required super.expDate,
    required super.posterUrl,
  });

  factory MovieModel.fromEntity(Movie movie) {
    return MovieModel(
      assetsName: movie.assetsName,
      title: movie.title,
      actors: movie.actors,
      directors: movie.directors,
      rating: movie.rating,
      synopsis: movie.synopsis,
      availDate: movie.availDate,
      expDate: movie.expDate,
      posterUrl: movie.posterUrl,
    );
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      assetsName: map['Asset Name'],
      title: map['Metadata']['Title'],
      actors: map['Metadata']['Actors'],
      directors: map['Metadata']['Directors'],
      rating: map['Metadata']['Rating'],
      synopsis: map['Metadata']['Synopsis'],
      availDate: map['Metadata']['Avail Date'],
      expDate: map['Metadata']['Exp Date'],
      posterUrl: map['Images']['Image URL']['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Asset Name': assetsName,
      'Metadata': {
        'Title': title,
        'Actors': actors,
        'Directors': directors,
        'Rating': rating,
        'Synopsis': synopsis,
        'Avail Date': availDate,
        'Exp Date': expDate,
      },
      'Images': {
        'Image URL': {
          'label': 'Image',
          'url': posterUrl,
        },
      },
    };
  }
}