import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/app/services/db_service.dart';
import 'package:movies_list/app/model/movie.dart';

class ListingController extends GetxController {
  final DbService _dbService = DbService();
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final dbMovies = await _dbService.getMovies();
      movies.assignAll(dbMovies);
    } catch (e) {
      debugPrint('Error loading movies: $e');
    }
  }
}
