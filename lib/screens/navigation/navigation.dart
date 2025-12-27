import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/controllers/navigation_controller.dart';
import 'package:nutritionist_app/screens/home/home_screen.dart';
import 'package:nutritionist_app/screens/navigation/widgets/nav_bar_item.dart';
import 'package:nutritionist_app/utils/assets.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../utils/app_colors.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller= Get.isRegistered() ? Get.find() : Get.put(NavigationController());
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70.h,
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 51.w),
          // padding: EdgeInsets.all(6.r),
          margin: EdgeInsets.symmetric(horizontal: 24.w).copyWith(bottom: 24.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [
                AppColors.yellow2Color,
                AppColors.yellow3Color,
                AppColors.yellow2Color,
              ],
            ),
            borderRadius: BorderRadius.circular(44.r),
          ),
          child: Center(
            child: Obx(()=>Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavBarItem(
                  onPress: (){
                    controller.selectedIndex.value=0;
                  },
                  svgIconPath: Assets.homeIcon,
                  title: 'Home',
                  isSelected: controller.selectedIndex.value==0,
                ),
                NavBarItem(
                  onPress: (){
                    controller.selectedIndex.value=1;
                  },
                  svgIconPath: Assets.progressIcon,
                  // iconData: Icons.chart,
                  title: 'Progress',
                  isSelected: controller.selectedIndex.value==1,
                ),
                NavBarItem(
                  onPress: (){
                    controller.selectedIndex.value=2;
                  },
                  // svgIconPath: Assets.homeIcon,
                  iconData: Icons.auto_awesome,
                  title: 'Cal AI',
                  isSelected: controller.selectedIndex.value==2,
                ),
                NavBarItem(
                  onPress: (){
                    controller.selectedIndex.value=3;
                  },
                  // svgIconPath: Assets.homeIcon,
                  iconData: Icons.grid_view_rounded,
                  // iconData: Icons.apps,
                  title: 'More',
                  isSelected: controller.selectedIndex.value==3,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
