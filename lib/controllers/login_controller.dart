import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_persons/models/user_model.dart';
import 'package:marvel_persons/services/auth.dart';
import 'package:marvel_persons/services/storage.dart';
import 'package:marvel_persons/utils/config.dart';
import 'package:marvel_persons/utils/routes.dart';

class LoginController extends GetxController {
  final AuthService authService;

  LoginController({required this.authService});
  final keyLoader = GlobalKey<FormState>();
  RxBool _loading = RxBool(false);
  RxBool checkBoxValue = RxBool(true);

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  late String? kindOfUser;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginWithGoogle() async {
    print("entrou");
    loading = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      await StorageService.box.write(Config.ACCESS_TOKEN, googleUser!.id);

      UserModel user = UserModel();
      user.email = googleUser.email;

      authService.setUserOffline(user);

      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      loading = false;
      print('error: $e');
    }
  }
}
