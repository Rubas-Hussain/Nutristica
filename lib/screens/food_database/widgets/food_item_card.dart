import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class FoodItemCard extends StatelessWidget {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fats;
  final String servingSize;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.servingSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.offWhiteColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.1),
          width: 1.5.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.m500black16,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Serving: $servingSize',
                      style: AppTextStyles.r400grey12,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.lightGreenColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '$calories kcal',
                  style: AppTextStyles.m500black14.copyWith(
                    color: AppColors.darkGreenColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutrientItem('Protein', '${protein}g', AppColors.blueColor),
              _buildNutrientItem('Carbs', '${carbs}g', AppColors.orangeColor),
              _buildNutrientItem('Fats', '${fats}g', AppColors.lightGreenColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.m500black16.copyWith(
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyles.r400grey10,
        ),
      ],
    );
  }
}

