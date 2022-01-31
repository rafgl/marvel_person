import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/controllers/comics/comics_detail_controller.dart';

class ComicsDetailsPage extends GetView<ComicsDetailController> {
  const ComicsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120.0),
        SizedBox(height: 10.0),
        Text(
          controller.characterDetailsArgs.character!.name.toString(),
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        SizedBox(height: 30.0),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "${controller.characterDetailsArgs.character!.thumbnail!.path}/landscape_medium.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
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
    );

    final bottomContentText = Text(
      controller.characterDetailsArgs.character!.description != ""
          ? controller.characterDetailsArgs.character!.description.toString()
          : "Este personagem não tem biografia.",
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Biografia:"),
            bottomContentText,
          ],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            topContent,
            bottomContent,
            controller.characterDetailsArgs.character!.description == ""
                ? Image.asset("assets/img/alert.png", width: 100)
                : Container(),
            SizedBox(
                height:
                    controller.characterDetailsArgs.character!.description == ""
                        ? 30
                        : 0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: controller
                    .characterDetailsArgs.character!.comics!.items!.length,
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      controller.characterDetailsArgs.character!.comics!
                          .items![index].name
                          .toString(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
