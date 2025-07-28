import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaveButtonController extends GetxController {
  var isTapped = false.obs;

  void handleTap(VoidCallback callback) {
    isTapped.value = true;
    callback();
    Future.delayed(const Duration(milliseconds: 150), () {
      isTapped.value = false;
    });
  }
}
