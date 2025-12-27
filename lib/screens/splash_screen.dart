import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/screens/navigation/navigation.dart';
import 'package:nutritionist_app/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:2500),
    );

    // Height rises in the first 50% of the animation
    _heightAnimation = Tween<double>(
      begin: 0,
      end: Get.height * 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.65, curve: Curves.easeInQuad),
      ),
    );

    // Width expands in the last 50% of the animation
    _widthAnimation = Tween<double>(
      begin: Get.width * 0.23,
      end: Get.width * 1, // adjust max width as needed
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start animation after 500 ms
    // Future.delayed(const Duration(milliseconds: 100), () {
      _controller.forward();
    // });

    // Optional: navigate after animation
    Timer(const Duration(milliseconds: 2400), () {
      Get.offAll(Navigation(),transition: Transition.zoom);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/logo/wise.png',
              color: AppColors.blackColor,
              height: context.height * 0.3,
              width: context.width * 0.3,
            ),
          ),
          // Animated white container
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double maxRadius = context.width * 0.2;
              double radius = maxRadius *
                  (1 - (_heightAnimation.value / (Get.height * 0.3)));
              radius = radius.clamp(0, maxRadius);

              return Positioned(
                bottom: 0,
                left: (Get.width - _widthAnimation.value) / 2, // center
                child: Container(
                  height: _heightAnimation.value,
                  width: _widthAnimation.value,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [
                        // Color(0xfff78f5d).withOpacity(0.2),
                        // Color(0xffdbf547),
                        AppColors.yellow2Color,
                        AppColors.yellow2Color,
                        // AppColors.yellow2Color.withOpacity(0.2),
                        // AppColors.yellow3Color,
                        // Color(0xfffdeee8),


                        AppColors.offWhiteColor,
                        AppColors.offWhiteColor,
                        AppColors.offWhiteColor,
                        AppColors.offWhiteColor,
                      ],
                    ),


                    borderRadius: BorderRadius.only(
                      topRight: _heightAnimation.value==context.height ?
                      Radius.circular(context.width * 0)
                          :
                      Radius.circular(context.width * 0.2),
                      topLeft: _heightAnimation.value==context.height ?
                      Radius.circular(context.width * 0)
                          :
                      Radius.circular(context.width * 0.2),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: context.height * 0.1,
                          width: context.width * 0.2,
                          decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              size: context.height * 0.055,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}