import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/bindings/comics/comics_details_bindings.dart';
import 'package:marvel_persons/components/input_text.dart';
import 'package:marvel_persons/controllers/comics/comics_controller.dart';
import 'package:marvel_persons/models/args/comicsDetailsArgs.dart';
import 'package:marvel_persons/utils/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'comisc_details.dart';

class ComicsPage extends GetView<ComicsController> {
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
              onFieldSubmitted: controller.getComicsForTitle,
              textCapitalization: TextCapitalization.words,
              textController: controller.filterSearch,
            ),
            centerTitle: true,
          ),
          body: controller.comic.isNotEmpty
              ? SafeArea(
                  child: ListView.builder(
                    itemCount: controller.comic.length,
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
                                  "${controller.comic[index].thumbnail!.path}/landscape_medium.jpg",
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text(
                          controller.comic[index].title.toString(),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Serie: ${controller.comic[index].series!.name.toString()}",
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_outlined),
                          onPressed: () {
                            Get.to(
                              ComicsDetailsPage(),
                              binding: ComicsDetailBinding(),
                              arguments: ComicsDetailsArgs(
                                comics: controller.comic[index],
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Get.to(
                            ComicsDetailsPage(),
                            binding: ComicsDetailBinding(),
                            arguments: ComicsDetailsArgs(
                              comics: controller.comic[index],
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
