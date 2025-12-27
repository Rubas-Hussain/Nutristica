import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/calculate_bmi/calculate_bmi_screen.dart';
import 'package:nutritionist_app/screens/food_database/food_database_screen.dart';
import 'package:nutritionist_app/screens/meal_plans/meal_plans_screen.dart';
import 'package:nutritionist_app/screens/nutrition_tips/nutrition_tips_screen.dart';
import 'package:nutritionist_app/screens/profile/profile_screen.dart';
import 'package:nutritionist_app/screens/settings/settings_screen.dart';

import '../screens/explore_more/widgets/feature_item_model.dart';
import '../utils/app_colors.dart';

class ExploreMoreController extends GetxController{

  final features = [
    FeatureItem(
      icon: LucideIcons.user,
      title: 'Profile',
      subtitle: 'View & edit profile',
      color: AppColors.blueColor,
      onTap: () {
        Get.to(ProfileScreen());
        // Navigate to profile screen
      },
    ),
    FeatureItem(
      icon: LucideIcons.settings,
      title: 'Settings',
      subtitle: 'App preferences',
      // color: AppColors.offWhiteColor,
      color: AppColors.greyColor,
      onTap: () {
        Get.to(() => SettingsScreen());
      },
    ),
    FeatureItem(
      icon: LucideIcons.activity,
      title: 'Calculate BMI',
      subtitle: 'Body Mass Index',
      color: AppColors.lightBlueColor,
      onTap: () {
        Get.to(() => CalculateBMIScreen());
      },
    ),
    FeatureItem(
      icon: LucideIcons.utensilsCrossed,
      title: 'Meal Plans',
      subtitle: 'Diet plans',
      color: AppColors.orangeColor,
      onTap: () {
        Get.to(() => MealPlansScreen());
      },
    ),
    // _FeatureItem(
    //   icon: LucideIcons.droplet,
    //   title: 'Water Intake',
    //   subtitle: 'Track hydration',
    //   color: AppColors.lightBlueColor,
    //   onTap: () {
    //     // Navigate to water tracker
    //   },
    // ),
    // _FeatureItem(
    //   icon: LucideIcons.dumbbell,
    //   title: 'Exercise Log',
    //   subtitle: 'Track workouts',
    //   color: AppColors.lightGreenColor,
    //   onTap: () {
    //     // Navigate to exercise log
    //   },
    // ),
    // FeatureItem(
    //   icon: LucideIcons.lightbulb,
    //   title: 'Nutrition Tips',
    //   subtitle: 'Health advice',
    //   color: AppColors.yellow4Color,
    //   onTap: () {
    //     Get.to(() => NutritionTipsScreen());
    //   },
    // ),
    FeatureItem(
      icon: LucideIcons.database,
      title: 'Food Database',
      subtitle: 'Nutrition info',
      color: AppColors.darkGreenColor,
      onTap: () {
        Get.to(() => FoodDatabaseScreen());
      },
    ),
  ];

}