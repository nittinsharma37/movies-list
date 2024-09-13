import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/app/config/api_config.dart';
import 'package:movies_list/app/model/movie.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchMovies() async {
    try {
      final response =
          await _dio.get('${ApiConfig.baseUrl}${ApiConfig.moviesEndpoint}');

      // debugPrint('Response Status Code: ${response.statusCode}');
      // debugPrint('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        // debugPrint('Data is a list with ${data.length} items.');
        return data
            .map((json) {
              try {
                return Movie.fromJson(json);
              } catch (e) {
                // debugPrint('Error parsing movie JSON: $e');
                return null;
              }
            })
            .whereType<Movie>()
            .toList();
      } else {
        debugPrint(
            'Error: Failed to load movies. Status code: ${response.statusCode}');
        debugPrint('Response Body: ${response.data}');
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      debugPrint('Error fetching movies: $e');

      if (e is DioException) {
        debugPrint('DioError Type: ${e.type}');
        debugPrint('DioError Message: ${e.message}');
        if (e.response != null) {
          debugPrint('DioError Response Status: ${e.response?.statusCode}');
          debugPrint('DioError Response Data: ${e.response?.data}');
        }
      }

      rethrow;
    }
  }
}
