// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/controllers/dashboard_controller.dart';
import 'package:marvel_persons/services/storage.dart';
import 'package:marvel_persons/utils/colors.dart';
import 'package:marvel_persons/utils/routes.dart';
import 'package:shimmer/shimmer.dart';

class DashBoardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            await StorageService.box.remove('user');
            Get.toNamed(Routes.login);
          },
        ),
        backgroundColor: MyColors.red,
        title: Image.asset(
          'assets/img/logo.png',
          width: 100,
        ),
        centerTitle: true,
      ),
      // ignore: invalid_use_of_protected_member
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                controller.loading == false
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (((MediaQuery.of(context).size.width - 10) / 2) /
                                  200),
                          controller:
                              new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          children: List.generate(
                            controller.listsForPersons.length,
                            (index) {
                              double size =
                                  (MediaQuery.of(context).size.width - 15 * 3) /
                                      2;
                              return Container(
                                margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
                                height: size,
                                width: size,
                                decoration: BoxDecoration(
                                  color:
                                      controller.listsForPersons[index].color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Stack(
                                  children: [
                                    Obx(
                                      () => Positioned(
                                        top: 15,
                                        left: 10,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Quadrinhos: ${controller.listsForPersons[index].count}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: size - 15 * 2,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          controller
                                              .listsForPersons[index].title!.tr,
                                          maxLines: 3,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      child: Container(
                                        width: 190,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Clique aqui e vá para a listagem!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: Ink(
                                        child: InkWell(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          highlightColor:
                                              Colors.black.withOpacity(0.2),
                                          splashColor:
                                              Colors.white.withOpacity(0.3),
                                          onTap: () {
                                            Future.delayed(
                                                Duration(milliseconds: 100),
                                                () {
                                              Get.offNamedUntil(
                                                  controller
                                                      .listsForPersons[index]
                                                      .route!,
                                                  (route) => true);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (((MediaQuery.of(context).size.width - 10) / 2) /
                                  200),
                          controller:
                              new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          children: List.generate(
                            10,
                            (index) {
                              double size =
                                  (MediaQuery.of(context).size.width - 15 * 3) /
                                      2;
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  height: size,
                                  width: size,
                                  child: Shimmer.fromColors(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    direction: ShimmerDirection.ltr,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
