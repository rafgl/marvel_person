// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/controllers/splash_controller.dart';
import 'package:marvel_persons/utils/colors.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: MyColors.blue),
        child: const Center(child: Text("fewfew")),
      ),
    );
  }
}
