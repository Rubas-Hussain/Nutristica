import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_text_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class BMICalculatorForm extends StatefulWidget {
  final Function(double weight, double height) onCalculate;

  const BMICalculatorForm({
    super.key,
    required this.onCalculate,
  });

  @override
  State<BMICalculatorForm> createState() => _BMICalculatorFormState();
}

class _BMICalculatorFormState extends State<BMICalculatorForm> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final weight = double.tryParse(weightController.text);
      final height = double.tryParse(heightController.text);

      if (weight != null && height != null && weight > 0 && height > 0) {
        widget.onCalculate(weight, height);
      }
    }
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.offWhiteColor,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.1),
                width: 1.5.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Your Details',
                  style: AppTextStyles.m500black24.copyWith(
                    color: AppColors.black2Color,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Weight (kg)',
                  style: AppTextStyles.m500black16,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: weightController,
                  hintText: 'Enter your weight',
                  type: TextInputType.number,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Height (cm)',
                  style: AppTextStyles.m500black16,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: heightController,
                  hintText: 'Enter your height',
                  type: TextInputType.number,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black2Color,
                      foregroundColor: AppColors.offWhiteColor,
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Calculate BMI',
                      style: AppTextStyles.m500white12.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

