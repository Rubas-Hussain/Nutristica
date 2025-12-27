import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/controllers/explore_more_controller.dart';
import 'package:nutritionist_app/screens/explore_more/widgets/feature_item_model.dart';
import 'package:nutritionist_app/screens/explore_more/widgets/grid_options.dart';
import 'package:nutritionist_app/screens/explore_more/widgets/optional_options.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/decorated_background_container.dart';
import 'widgets/feature_tile.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  late final ExploreMoreController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered() ? Get.find() : Get.put(ExploreMoreController());
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationHeaderWidget(title: 'Explore More'),
                SizedBox(height: 30.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        // Optional grid tiles
                        GridOptions(controller: controller),

                        SizedBox(height: 20.h),

                        // Optional horizontal tiles
                        // OptionalOptions()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  


}


