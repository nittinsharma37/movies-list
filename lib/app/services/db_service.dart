import 'dart:convert';

import 'package:movies_list/app/model/movie.dart';
import 'package:path/path.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    sqfliteFfiInit();
    return await openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE movies(id TEXT PRIMARY KEY, name TEXT, posterUrl TEXT, year TEXT, runtime TEXT, genre TEXT, cast TEXT, director TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'movies',
      {
        'id': movie.imdbId,
        'name': movie.name,
        'posterUrl': movie.posterUrl,
        'year': movie.year,
        'runtime': movie.runtime,
        'genre': jsonEncode(movie.genre),
        'cast': movie.castJson,
        'director': movie.directorJson,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Movie>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');

    return List.generate(maps.length, (i) {
      final movieJson = maps[i];
      return Movie(
        imdbId: movieJson['id'] as String,
        name: movieJson['name'] as String,
        posterUrl: movieJson['posterUrl'] as String?,
        year: movieJson['year'] as String,
        runtime: movieJson['runtime'] as String?,
        genre: List<String>.from(jsonDecode(movieJson['genre'] as String)),
        cast:
            Movie.fromCastJson(movieJson['cast'] as String), // Deserialize cast
        director: Movie.fromDirectorJson(
            movieJson['director'] as String), // Deserialize director
      );
    });
  }
}
