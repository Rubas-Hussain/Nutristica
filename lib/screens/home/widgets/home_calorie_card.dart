import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/controllers/home_controller.dart';
import 'package:nutritionist_app/models/calorie_models/calorie_chart_data_model.dart';
import 'package:nutritionist_app/utils/app_textstyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';

class HomeCalorieCard extends StatelessWidget {
  final HomeController controller;

  const HomeCalorieCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166.h,
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.black2Color,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.9),width: 1.5.w)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('You have',style: AppTextStyles.m500white12.copyWith(fontSize: 24.sp,fontWeight: FontWeight.bold),),
                Text('1247',style: AppTextStyles.m500white12.copyWith(fontSize: 24.sp,fontWeight: FontWeight.bold),),
                Text('Calories left',style: AppTextStyles.m500white12,),
              ],
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Positioned(
                  top: 52.h,
                  left: 62.h,
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Color(0xFFFF4500),
                        Color(0xFFFF8C00),
                        Color(0xFFFFD700),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    // child: SvgPicture.asset(
                    //   Assets.peachIcon,
                    //   color: Colors.white,
                    //   height: 24.h,
                    //   width: 24.w,
                    // ),
                    child: Icon(LucideIcons.flame,color: Colors.white,size: 30.r,),
                    // child: Icon(Icons.local_fire_department_sharp,color: Colors.white,size: 24.r,),
                  ),),
              Container(
                height: context.height,
                width: 150.w,
                // color: Colors.red,
                child: SfCircularChart(
                  margin: EdgeInsets.zero,
                  // legend: Legend(
                  //   isVisible: true,
                  //   textStyle: AppTextStyles.l300white12,
                  //   position: LegendPosition.right,
                  //   overflowMode: LegendItemOverflowMode.scroll,
                  //   legendItemBuilder:
                  //       (
                  //         String legendText,
                  //         dynamic series,
                  //         dynamic point,
                  //         int seriesIndex,
                  //       ) {
                  //         return LegendItem(
                  //           legendText: legendText,
                  //           point: point,
                  //           seriesIndex: seriesIndex,
                  //           controller: controller,
                  //         );
                  //       },
                  // ),
                  series: <CircularSeries>[
                    RadialBarSeries<CalorieChartData, String>(
                      gap: '75%',
                      radius: '90',
                      dataSource: [controller.totalCalorieData],
                      xValueMapper: (CalorieChartData data, _) => data.nutrient,
                      yValueMapper: (CalorieChartData data, _) => data.value,
                      pointColorMapper: (CalorieChartData data, _) => data.color,
                      maximumValue: 100,
                      cornerStyle: CornerStyle.bothCurve,
                      trackColor: AppColors.offWhiteColor,
                      strokeColor: AppColors.yellow2Color,
                      // dataLabelSettings: const DataLabelSettings(
                      //   isVisible: true,
                      //   textStyle: TextStyle(color: Colors.white, fontSize: 12),
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
