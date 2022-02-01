import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/controllers/comics/comics_detail_controller.dart';

class ComicsDetailsPage extends GetView<ComicsDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "${controller.comics.thumbnail!.path}/landscape_medium.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.all(40.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 120.0),
                        SizedBox(height: 10.0),
                        Text(
                          controller.comics.title.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 8.0,
                  top: 60.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Biografia:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                        controller.comics.description != ""
                            ? controller.comics.description.toString()
                            : "Este personagem não tem biografia.",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 50),
                      if (controller.comics.isbn != null) ...[
                        Text("ISNB:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                          controller.comics.isbn.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                      SizedBox(height: 50),
                      Text("Páginas:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        controller.comics.pageCount.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text("Serie:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        controller.comics.series!.name.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 50),
                      controller.comics.characters!.items!.isNotEmpty
                          ? Text("Personagens:",
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      SizedBox(height: 10),
                      controller.comics.characters!.items!.isNotEmpty
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                itemCount:
                                    controller.comics.characters!.items!.length,
                                itemBuilder: (context, index) => Card(
                                  elevation: 6,
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    title: Text(
                                      controller
                                          .comics.characters!.items![index].name
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(height: 50),
                      controller.comics.characters!.items!.isNotEmpty
                          ? Text("Galeria de imagens:",
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      SizedBox(height: 10),
                      controller.comics.images!.isNotEmpty
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio:
                                    (((MediaQuery.of(context).size.width - 10) /
                                            2) /
                                        200),
                                controller: new ScrollController(
                                    keepScrollOffset: false),
                                shrinkWrap: true,
                                children: List.generate(
                                  controller.comics.images!.length,
                                  (index) {
                                    return Container(
                                      padding: EdgeInsets.only(left: 10.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              "${controller.comics.images![index].path}/landscape_medium.jpg"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: controller.comics.description == "" ? 30 : 0),

            // )
          ],
        ),
      ),
    );
  }
}
