import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_list/app/controller/listing_controller.dart';

import 'package:movies_list/app/widgets/movie_tile.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListingController controller = Get.put(ListingController());

    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return MovieTile(movie: movie, index: index + 1);
          },
        ),
      ),
    );
  }
}
