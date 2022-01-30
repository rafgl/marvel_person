import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/controllers/hqs/hqs_controller.dart';

class HQSPage extends GetView<HQSController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HQSPage')),
        body: SafeArea(child: Text('HQSController')));
  }
}
