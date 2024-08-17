import 'package:fatimid/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomResponse{
  dynamic data;
  bool hasError = false;
  int statusCode = 200;
  String? message;
  String? exception;
}

class Haitham extends StatelessWidget {
  const Haitham({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.spaceBtwItems),
          child: Container(
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
