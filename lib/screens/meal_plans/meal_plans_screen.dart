import 'package:flutter/material.dart';
import 'package:nutritionist_app/screens/meal_plans/widgets/meal_plan_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../widgets/decorated_background_container.dart';

class MealPlansScreen extends StatefulWidget {
  const MealPlansScreen({super.key});

  @override
  State<MealPlansScreen> createState() => _MealPlansScreenState();
}

class _MealPlansScreenState extends State<MealPlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: NavigationHeaderWidget(
                  title: 'Meal Plans',
                  showBackIcon: true,
                ),
              ),
              Expanded(
                child: _buildMealPlansList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealPlansList() {
    final mealPlans = _getMealPlans();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      itemCount: mealPlans.length,
      itemBuilder: (context, index) {
        final plan = mealPlans[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: MealPlanCard(
            title: plan['title'] as String,
            description: plan['description'] as String,
            calories: plan['calories'] as int,
            duration: plan['duration'] as String,
            difficulty: plan['difficulty'] as String,
            color: plan['color'] as Color,
            onTap: () {
              // Navigate to meal plan details
            },
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getMealPlans() {
    return [
      {
        'title': 'Weight Loss Plan',
        'description': 'Low-calorie meal plan designed for gradual weight loss',
        'calories': 1500,
        'duration': '4 weeks',
        'difficulty': 'Moderate',
        'color': AppColors.lightBlueColor,
      },
      {
        'title': 'Muscle Gain Plan',
        'description': 'High-protein plan to support muscle building',
        'calories': 2500,
        'duration': '8 weeks',
        'difficulty': 'Advanced',
        'color': AppColors.orangeColor,
      },
      {
        'title': 'Balanced Nutrition',
        'description': 'Well-rounded meal plan for maintaining a healthy lifestyle',
        'calories': 2000,
        'duration': '6 weeks',
        'difficulty': 'Easy',
        'color': AppColors.darkGreenColor,
      },
      {
        'title': 'Vegetarian Plan',
        'description': 'Plant-based meal plan rich in nutrients',
        'calories': 1800,
        'duration': '4 weeks',
        'difficulty': 'Moderate',
        'color': AppColors.lightGreenColor,
      },
      {
        'title': 'Keto Diet Plan',
        'description': 'Low-carb, high-fat meal plan',
        'calories': 1600,
        'duration': '6 weeks',
        'difficulty': 'Advanced',
        'color': AppColors.yellow4Color,
      },
    ];
  }
}

