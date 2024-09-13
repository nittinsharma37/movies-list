// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      imdbId: json['ImdbId'] as String,
      name: json['name'] as String,
      posterUrl: json['poster_url'] as String?,
      year: json['year'] as String,
      runtime: json['runtime'] as String?,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      director: json['director'] == null
          ? null
          : Director.fromJson(json['director'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'ImdbId': instance.imdbId,
      'name': instance.name,
      'poster_url': instance.posterUrl,
      'year': instance.year,
      'runtime': instance.runtime,
      'genre': instance.genre,
      'cast': instance.cast,
      'director': instance.director,
    };

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'name': instance.name,
    };

Director _$DirectorFromJson(Map<String, dynamic> json) => Director(
      name: json['name'] as String,
    );

Map<String, dynamic> _$DirectorToJson(Director instance) => <String, dynamic>{
      'name': instance.name,
    };
