import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/controllers/progress_controller.dart';
import 'package:nutritionist_app/screens/progress/widgets/bmi_card_widget.dart';
import 'package:nutritionist_app/screens/progress/widgets/goal_progress_widget.dart';
import 'package:nutritionist_app/screens/progress/widgets/progress_header_widget.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/decorated_background_container.dart';
import '../../widgets/multi_segment_slider.dart';
import '../../widgets/navigation_header_widget.dart';
import '../home/widgets/home_header.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late final ProgressController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered() ? Get.find() : Get.put(ProgressController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffcfcfc),
      // backgroundColor: Color(0xfff1f4f5),
      // backgroundColor: Colors.white,
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// top header of progress
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                    child: NavigationHeaderWidget(title: 'Progress'),
                ),

                SizedBox(height: 30.h),

                /// BMI card
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: BMICardWidget(controller: controller,),
                ),

                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: Text('Goal Progress',style: AppTextStyles.m500black24.copyWith(
                    color: AppColors.black2Color,
                    fontSize: 22.sp
                  ),),
                ),
                SizedBox(height: 10.h),

                GoalProgressWidget(controller: controller),

                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: Text('Calories',style: AppTextStyles.m500black24.copyWith(
                      color: AppColors.black2Color,
                      fontSize: 22.sp
                  ),),
                ),
                SizedBox(height: 10.h),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
