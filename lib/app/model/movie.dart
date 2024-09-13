import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'ImdbId')
  final String imdbId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'poster_url')
  final String? posterUrl;
  @JsonKey(name: 'year')
  final String year;
  @JsonKey(name: 'runtime')
  final String? runtime;
  @JsonKey(name: 'genre', defaultValue: [])
  final List<String> genre;
  @JsonKey(name: 'cast', defaultValue: [])
  final List<Cast> cast;
  @JsonKey(name: 'director')
  final Director? director;

  Movie({
    required this.imdbId,
    required this.name,
    this.posterUrl,
    required this.year,
    this.runtime,
    required this.genre,
    required this.cast,
    this.director,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  String get castJson => jsonEncode(cast.map((e) => e.toJson()).toList());
  String get directorJson => jsonEncode(director?.toJson() ?? {});

  static List<Cast> fromCastJson(String json) {
    final List<dynamic> list = jsonDecode(json);
    return list.map((e) => Cast.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Director? fromDirectorJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return map.isEmpty ? null : Director.fromJson(map);
  }
}

@JsonSerializable()
class Cast {
  @JsonKey(name: 'name')
  final String name;

  Cast({required this.name});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Director {
  @JsonKey(name: 'name')
  final String name;

  Director({required this.name});

  factory Director.fromJson(Map<String, dynamic> json) =>
      _$DirectorFromJson(json);
  Map<String, dynamic> toJson() => _$DirectorToJson(this);
}
