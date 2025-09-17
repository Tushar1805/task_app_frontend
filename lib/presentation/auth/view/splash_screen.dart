// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/resources/app_colors.dart';
import 'package:task_app/core/resources/app_images.dart';
import 'package:task_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      context.go(homeScreen);
    });
  }

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: SizedBox(
            width: size.width * 0.6,
            child: Image.asset(
              AppImages.appLogoIcon,
              height: size.width * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
