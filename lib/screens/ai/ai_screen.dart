import 'package:flutter/material.dart';
import 'package:nutritionist_app/screens/ai/widgets/ai_intro_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/decorated_background_container.dart';
import '../../widgets/food_log_floating_action_button.dart';

class AIScreen extends StatelessWidget {
  const AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationHeaderWidget(title: 'Nutritionist'),

                SizedBox(height: 30.h),

                // AI intro Card
                AIIntroCard(),

                SizedBox(height: 40.h),

                Text('Recent chats', style: AppTextStyles.m500black24)

              ],
            ),
          ),
        ),
      ),
        floatingActionButton: FoodLogFloatingActionButton(onPress: (){})
    );
  }
}


class HyriseBoxDecoration {
  static BoxDecoration defaultBox({
    Color color = Colors.white,
    Color borderColor = const Color(0xFFEAEAEA),
    double borderRadius = 15,
  }) {
    return BoxDecoration(
      color: color.withOpacity(0.1),
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}