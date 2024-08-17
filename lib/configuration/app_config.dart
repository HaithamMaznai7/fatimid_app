import 'package:fatimid/features/onboarding/screens/on_boarding.dart';
import 'package:fatimid/features/quran/screens/quran.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppConfig extends GetxController{
  static AppConfig get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();

  bool isSignedIn = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const QuranScreen()) : Get.offAll(() => const OnBoardingScreen());
  }
}