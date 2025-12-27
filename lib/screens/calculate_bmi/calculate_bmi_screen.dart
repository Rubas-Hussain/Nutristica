import 'package:flutter/material.dart';
import 'package:nutritionist_app/screens/calculate_bmi/widgets/bmi_calculator_form.dart';
import 'package:nutritionist_app/screens/calculate_bmi/widgets/bmi_result_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../widgets/decorated_background_container.dart';

class CalculateBMIScreen extends StatefulWidget {
  const CalculateBMIScreen({super.key});

  @override
  State<CalculateBMIScreen> createState() => _CalculateBMIScreenState();
}

class _CalculateBMIScreenState extends State<CalculateBMIScreen> {
  double? bmi;
  String? bmiCategory;
  Color? bmiColor;
  double? weight;
  double? height;

  void calculateBMI(double weightValue, double heightValue) {
    setState(() {
      weight = weightValue;
      height = heightValue;
      // BMI = weight (kg) / (height (m))^2
      // Height is in cm, so convert to meters
      double heightInMeters = heightValue / 100;
      bmi = weightValue / (heightInMeters * heightInMeters);

      // Determine category
      if (bmi! < 18.5) {
        bmiCategory = 'Underweight';
        bmiColor = AppColors.lightBlueColor;
      } else if (bmi! < 25) {
        bmiCategory = 'Healthy';
        bmiColor = AppColors.darkGreenColor;
      } else if (bmi! < 30) {
        bmiCategory = 'Overweight';
        bmiColor = AppColors.lightOrangeColor;
      } else {
        bmiCategory = 'Obese';
        bmiColor = AppColors.redColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationHeaderWidget(title: 'Calculate BMI', showBackIcon: true),
                  SizedBox(height: 30.h),
                  BMICalculatorForm(onCalculate: calculateBMI),
                  if (bmi != null) ...[
                    SizedBox(height: 30.h),
                    BMIResultCard(
                      bmi: bmi!,
                      category: bmiCategory!,
                      color: bmiColor!,
                      weight: weight!,
                      height: height!,
                    ),
                  ],
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

