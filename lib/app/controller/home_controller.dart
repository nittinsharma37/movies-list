import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/app/model/movie.dart';
import 'package:movies_list/app/services/api_service.dart';
import 'package:movies_list/app/services/db_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  final DbService _dbService = DbService();
  RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final dbMovies = await _dbService.getMovies();
      if (dbMovies.isEmpty) {
        final apiMovies = await _apiService.fetchMovies();
        movies.assignAll(apiMovies);

        for (var movie in apiMovies) {
          await _dbService.insertMovie(movie);
        }
      } else {
        movies.assignAll(dbMovies);
      }
    } catch (e) {
      debugPrint('Error loading movies: $e');
    }
  }
}
