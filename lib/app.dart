import 'package:fatimid/util/constants/colors.dart';
import 'package:fatimid/util/constants/image_strings.dart';
import 'package:fatimid/util/helpers/helper_functions.dart';
import 'package:fatimid/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: EHelper.isDarkMode(context) ? EColors.dark : EColors.light,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Image.asset(EImages.appIcon, height: 200,)
            ),
            const Center(
                child: CircularProgressIndicator(color: EColors.primaryColor,)
            ),
          ],
        ),
      ),
    );
  }
}