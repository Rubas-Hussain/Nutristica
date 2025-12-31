import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/controllers/home_controller.dart';
import 'package:nutritionist_app/screens/home/widgets/home_calorie_break_down_widget.dart';
import 'package:nutritionist_app/screens/home/widgets/home_calorie_card.dart';
import 'package:nutritionist_app/screens/home/widgets/home_header.dart';
import 'package:nutritionist_app/screens/home/widgets/legend_item.dart';
import 'package:nutritionist_app/utils/app_colors.dart';
import 'package:nutritionist_app/utils/app_textstyles.dart';
import 'package:nutritionist_app/utils/assets.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/decorated_background_container.dart';
import 'package:nutritionist_app/widgets/food_log_floating_action_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/calorie_models/calorie_chart_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered() ? Get.find() : Get.put(HomeController());
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header of home
                HomeHeader(),

                SizedBox(height: 30.h),

                //
                HomeCalorieCard(controller: controller),

                SizedBox(height: 30.h),

                HomeCalorieBreakDownWidget(controller: controller),

                SizedBox(height: 30.h),

                Text('Latest Logs', style: AppTextStyles.m500black24),

                SizedBox(height: 10.h),

                // Container(
                //   height: 96.h,
                //   width: context.width,
                //   padding: EdgeInsets.symmetric(horizontal:12.w,vertical: 10.h),
                //   decoration: BoxDecoration(
                //     color: AppColors.lightGreyColor,
                //     borderRadius: BorderRadius.circular(18.r),
                //     border: Border.all(
                //       color: AppColors.greyColor.withOpacity(0.1),
                //       width: 1.5.w,
                //     ),
                //   ),
                //   child: Row(
                //     // crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(12.r),
                //         child: SizedBox(
                //           height: 90.h,
                //           width: 100.w,
                //           child: Image.network(
                //             'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200',
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 12.w),
                //       // Add other widgets here if needed
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Pancakes',
                //                 style: AppTextStyles.m500black14,
                //               ),
                //               Text(
                //                 'Pancakes',
                //                 style: AppTextStyles.m500black14,
                //               ),
                //             ],
                //           ),
                //           Text(
                //             'Pancakes',
                //             style: AppTextStyles.m500black14,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 'Pancakes',
                //                 style: AppTextStyles.m500black14,
                //               ),
                //               Text(
                //                 'Pancakes',
                //                 style: AppTextStyles.m500black14,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FoodLogFloatingActionButton(onPress: (){})
    );
  }
}
