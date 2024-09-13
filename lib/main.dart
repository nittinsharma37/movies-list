import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/app/view/home_screen.dart';
import 'package:movies_list/app/view/movie_list_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/listing', page: () => const ListingScreen()),
      ],
    );
  }
}
