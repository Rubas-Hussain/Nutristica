import 'package:flutter/material.dart';
import 'package:nutritionist_app/screens/nutrition_tips/widgets/nutrition_tip_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../widgets/decorated_background_container.dart';

class NutritionTipsScreen extends StatefulWidget {
  const NutritionTipsScreen({super.key});

  @override
  State<NutritionTipsScreen> createState() => _NutritionTipsScreenState();
}

class _NutritionTipsScreenState extends State<NutritionTipsScreen> {
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
                  title: 'Nutrition Tips',
                  showBackIcon: true,
                ),
              ),
              Expanded(
                child: _buildTipsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipsList() {
    final tips = _getNutritionTips();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        final tip = tips[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: NutritionTipCard(
            title: tip['title'] as String,
            description: tip['description'] as String,
            category: tip['category'] as String,
            color: tip['color'] as Color,
            onTap: () {
              // Navigate to tip details or show full tip
            },
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getNutritionTips() {
    return [
      {
        'title': 'Eat More Whole Foods',
        'description':
        'Focus on whole, unprocessed foods like fruits, vegetables, whole grains, and lean proteins for better nutrition.',
        'category': 'Diet Basics',
        'color': AppColors.darkGreenColor,
      },
      {
        'title': 'Stay Hydrated',
        'description':
        'Drink at least 8 glasses of water daily. Proper hydration supports digestion, metabolism, and overall health.',
        'category': 'Hydration',
        'color': AppColors.lightBlueColor,
      },
      {
        'title': 'Portion Control',
        'description':
        'Use smaller plates and pay attention to serving sizes. Mindful eating helps prevent overeating.',
        'category': 'Eating Habits',
        'color': AppColors.orangeColor,
      },
      {
        'title': 'Include Protein in Every Meal',
        'description':
        'Protein helps maintain muscle mass, keeps you full longer, and supports healthy metabolism throughout the day.',
        'category': 'Macronutrients',
        'color': AppColors.blueColor,
      },
      {
        'title': 'Eat the Rainbow',
        'description':
        'Different colored fruits and vegetables provide various vitamins, minerals, and antioxidants your body needs.',
        'category': 'Fruits & Vegetables',
        'color': AppColors.lightGreenColor,
      },
      {
        'title': 'Limit Added Sugars',
        'description':
        'Reduce consumption of sugary drinks and processed foods. Natural sugars from fruits are a better choice.',
        'category': 'Sugar Intake',
        'color': AppColors.redColor,
      },
      {
        'title': 'Don\'t Skip Breakfast',
        'description':
        'A healthy breakfast kickstarts your metabolism and provides energy for the day ahead.',
        'category': 'Meal Timing',
        'color': AppColors.yellow4Color,
      },
      {
        'title': 'Plan Your Meals',
        'description':
        'Meal planning helps you make healthier choices, saves time, and reduces the temptation to order takeout.',
        'category': 'Meal Planning',
        'color': AppColors.darkGreenColor,
      },
      {
        'title': 'Read Food Labels',
        'description':
        'Understanding nutrition labels helps you make informed choices and avoid hidden unhealthy ingredients.',
        'category': 'Smart Shopping',
        'color': AppColors.blueColor,
      },
      {
        'title': 'Cook at Home More Often',
        'description':
        'Home-cooked meals give you control over ingredients and portion sizes, leading to healthier eating habits.',
        'category': 'Cooking',
        'color': AppColors.orangeColor,
      },
    ];
  }

}

