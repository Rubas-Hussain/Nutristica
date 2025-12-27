import 'package:flutter/material.dart';
import 'package:nutritionist_app/controllers/explore_more_controller.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import 'feature_tile.dart';

class GridOptions extends StatelessWidget {
  final ExploreMoreController controller;
  const GridOptions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.1,
      ),
      itemCount: controller.features.length,
      itemBuilder: (context, index) {
        return FeatureTile(feature: controller.features[index]);
      },
    );
  }
}
