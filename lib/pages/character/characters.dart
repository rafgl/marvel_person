import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/bindings/character/character_details_bindings.dart';
import 'package:marvel_persons/components/input_text.dart';
import 'package:marvel_persons/controllers/character/character_controller.dart';
import 'package:marvel_persons/models/args/characterDetailsArgs.dart';
import 'package:marvel_persons/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

import 'character_details.dart';

class CharacterPage extends GetView<CharacterController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.red,
            title: InputText(
              hintText: "Pesquisar...",
              textInputType: TextInputType.name,
              showTitle: false,
              onFieldSubmitted: controller.getCharacterForName,
              textCapitalization: TextCapitalization.words,
              textController: controller.filterSearch,
            ),
            centerTitle: true,
          ),
          body: controller.character.isNotEmpty
              ? SafeArea(
                  child: ListView.builder(
                    // ignore: invalid_use_of_protected_member
                    itemCount: controller.character.value.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 6,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Container(
                            height: 50,
                            color: Colors.red,
                            width: 50,
                            child: CachedNetworkImage(
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              imageUrl:
                                  // ignore: invalid_use_of_protected_member
                                  "${controller.character.value[index].thumbnail!.path}/landscape_medium.jpg",
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text(
                          controller.character[index].name.toString(),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Número de Comics: ${controller.character[index].comics!.available.toString()}",
                                maxLines: 2,
                              ),
                              AutoSizeText(
                                controller.character[index].description
                                    .toString(),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_outlined),
                          onPressed: () {
                            Get.to(
                              CharacterDetailPage(),
                              binding: CharacterDetailBinding(),
                              // arguments: CharacterDetailsArgs(
                              //   character: controller.character.value[index],
                              // ),
                            );
                          },
                        ),
                        onTap: () {
                          Get.to(
                            CharacterDetailPage(),
                            binding: CharacterDetailBinding(),
                            arguments: CharacterDetailsArgs(
                              // ignore: invalid_use_of_protected_member
                              character: controller.character.value[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                    child: Shimmer.fromColors(
                      period: Duration(seconds: 2),
                      child: Column(
                        children: [0, 1, 2, 3, 4, 5]
                            .map(
                              (_) => Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 8.0,
                                                  color: Colors.white,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 8.0,
                                                  color: Colors.white,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 2.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                46,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      direction: ShimmerDirection.ltr,
                    ),
                  ),
                ));
    });
  }
}
