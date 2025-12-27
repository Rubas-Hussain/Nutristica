import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/controllers/home_controller.dart';
import 'package:nutritionist_app/screens/home/widgets/home_calorie_card.dart';
import 'package:nutritionist_app/screens/home/widgets/home_header.dart';
import 'package:nutritionist_app/screens/home/widgets/legend_item.dart';
import 'package:nutritionist_app/utils/app_colors.dart';
import 'package:nutritionist_app/utils/app_textstyles.dart';
import 'package:nutritionist_app/utils/assets.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/decorated_background_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/calorie_models/calorie_chart_data_model.dart';



class HomeCalorieBreakDownWidget extends StatelessWidget {
  final HomeController controller;
  const HomeCalorieBreakDownWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for(int i=0;i<3;i++)
          Container(
            // height: 146.h,
            width: context.width/3.55,
            // margin: EdgeInsetsGeometry.only(right: 8.w),
            padding: EdgeInsets.all(12.r).copyWith(bottom: 4.h),
            decoration: BoxDecoration(
                color: AppColors.black2Color,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: AppColors.greyColor.withOpacity(0.9),width: 1.5.w)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('126g',style: AppTextStyles.m500white12.copyWith(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                Text('${controller.chartData[i].nutrient} left',style: AppTextStyles.r400white8.copyWith(fontSize: 14.sp,),),
                Stack(
                  children: [
                    // Positioned(
                    //   top: 37.h,
                    //   left: 36.5.h,
                    //   child: ShaderMask(
                    //     shaderCallback: (bounds) => LinearGradient(
                    //       colors: [
                    //         Color(0xFFFF4500),
                    //         Color(0xFFFF8C00),
                    //         Color(0xFFFFD700),
                    //       ],
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //     ).createShader(bounds),
                    //     // child: SvgPicture.asset(
                    //     //   Assets.peachIcon,
                    //     //   color: Colors.white,
                    //     //   height: 24.h,
                    //     //   width: 24.w,
                    //     // ),
                    //     child: Icon(LucideIcons.flame,color: Colors.white,size: 20.r,),
                    //     // child: Icon(Icons.local_fire_department_sharp,color: Colors.white,size: 24.r,),
                    //   ),),
                    SizedBox(
                      // color:Colors.red,
                      width: 100,
                      height: 100,

                      child: SfCircularChart(
                        margin: EdgeInsets.zero,
                        series: <CircularSeries>[
                          RadialBarSeries<CalorieChartData, String>(
                            gap: '0%',
                            dataSource: [controller.chartData[i]],
                            xValueMapper: (CalorieChartData data, _) => data.nutrient,
                            yValueMapper: (CalorieChartData data, _) => data.value,
                            pointColorMapper: (CalorieChartData data, _) => data.color,
                            maximumValue: 100,
                            cornerStyle: CornerStyle.bothCurve,
                            trackColor: AppColors.offWhiteColor,
                            // strokeColor: AppColors.offWhiteColor,
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
          ),
      ],
    );
  }
}
