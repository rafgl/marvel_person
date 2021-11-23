// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/bindings/character_details_bindings.dart';
import 'package:marvel_persons/controllers/home_controller.dart';

import 'character_details.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        // if (scrollState.metrics.extentAfter < 150) {
        //   if (controller.loadMoreCategory == true) {
        //     controller.loadMoreNoticesCategory(
        //         controller.city.toString(), controller.category.toString());
        //   } else {
        //     controller.loadMore(controller.city.toString());
        //   }
        // }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: controller.refresh,
        child: Scaffold(
          body: SafeArea(
              child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CachedNetworkImage(
                      height: 30,
                      width: 30,
                      imageUrl: "http://via.placeholder.com/350x150",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                title: const Text("Hulk"),
                // Text(controller.character.value[index].name.toString()),
                subtitle: const Text("Description"),
                // Text(controller.character.value[index].description.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_outlined),
                  onPressed: () {
                    Get.to(
                      const CharacterDetailPage(),
                      binding: CharacterDetailBinding(),
                      // arguments: CharacterDetailsArgs(
                      //   character: controller.character.value[index],
                      // ),
                    );
                  },
                ),
                onTap: () {
                  Get.to(
                    const CharacterDetailPage(),
                    binding: CharacterDetailBinding(),
                    // arguments: CharacterDetailsArgs(
                    //   character: controller.character.value[index],
                    // ),
                  );
                },
              ),
            ),
          )),
        ),
      ),
    );
  }
}
