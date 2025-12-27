import 'package:flutter/material.dart';
import 'package:nutritionist_app/screens/food_database/widgets/food_item_card.dart';
import 'package:nutritionist_app/screens/food_database/widgets/food_search_bar.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/decorated_background_container.dart';

class FoodDatabaseScreen extends StatefulWidget {
  const FoodDatabaseScreen({super.key});

  @override
  State<FoodDatabaseScreen> createState() => _FoodDatabaseScreenState();
}

class _FoodDatabaseScreenState extends State<FoodDatabaseScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                  title: 'Food Database',
                  showBackIcon: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FoodSearchBar(
                  controller: searchController,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        searchQuery = value;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: _buildFoodList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodList() {
    // Mock data - replace with actual data source
    final foods = _getFoodItems();

    final filteredFoods = searchQuery.isEmpty
        ? foods
        : foods
            .where((food) => food['name']
                .toString()
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();

    if (filteredFoods.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No foods found',
              style: AppTextStyles.m500black16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try searching with different keywords',
              style: AppTextStyles.r400grey12,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: filteredFoods.length,
      itemBuilder: (context, index) {
        final food = filteredFoods[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: FoodItemCard(
            name: food['name'] as String,
            calories: food['calories'] as int,
            protein: food['protein'] as double,
            carbs: food['carbs'] as double,
            fats: food['fats'] as double,
            servingSize: food['servingSize'] as String,
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getFoodItems() {
    return [
      {
        'name': 'Grilled Chicken Breast',
        'calories': 231,
        'protein': 43.5,
        'carbs': 0.0,
        'fats': 5.0,
        'servingSize': '100g',
      },
      {
        'name': 'Brown Rice',
        'calories': 111,
        'protein': 2.6,
        'carbs': 23.0,
        'fats': 0.9,
        'servingSize': '100g',
      },
      {
        'name': 'Salmon',
        'calories': 208,
        'protein': 20.0,
        'carbs': 0.0,
        'fats': 13.0,
        'servingSize': '100g',
      },
      {
        'name': 'Broccoli',
        'calories': 34,
        'protein': 2.8,
        'carbs': 7.0,
        'fats': 0.4,
        'servingSize': '100g',
      },
      {
        'name': 'Oatmeal',
        'calories': 68,
        'protein': 2.4,
        'carbs': 12.0,
        'fats': 1.4,
        'servingSize': '100g',
      },
      {
        'name': 'Greek Yogurt',
        'calories': 59,
        'protein': 10.0,
        'carbs': 3.6,
        'fats': 0.4,
        'servingSize': '100g',
      },
      {
        'name': 'Banana',
        'calories': 89,
        'protein': 1.1,
        'carbs': 23.0,
        'fats': 0.3,
        'servingSize': '100g',
      },
      {
        'name': 'Whole Wheat Bread',
        'calories': 247,
        'protein': 13.0,
        'carbs': 41.0,
        'fats': 4.2,
        'servingSize': '100g',
      },
    ];
  }
}

