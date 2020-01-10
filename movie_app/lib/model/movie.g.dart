// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    name: json['title'] as String,
    posterImageUrl: json['poster_path'] as String,
    genresId: (json['genre_ids'] as List).map((e) => e as int).toList(),
    releaseDate: json['release_date'] as String,
    overview: json['overview'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.name,
      'poster_path': instance.posterImageUrl,
      'genre_ids': instance.genresId,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
    };
