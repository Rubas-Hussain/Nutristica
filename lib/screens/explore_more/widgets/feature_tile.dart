import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import 'feature_item_model.dart';

class FeatureTile extends StatelessWidget {
  final FeatureItem feature;

  const FeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: feature.onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.black2Color.withOpacity(0.1),
            width: 1.5.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.r,
              width: 50.r,
              decoration: BoxDecoration(
                color: feature.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: feature.color,width: 1.5.w),
                  // boxShadow: [
                //   BoxShadow(
                //       color: feature.color.withOpacity(0.4),
                //       spreadRadius: 5.r,
                //       blurRadius: 100.r
                //   )
                // ]
              ),
              child: Icon(
                feature.icon,
                color: feature.color,
                size: 28.r,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              feature.title,
              style: AppTextStyles.m500black16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              feature.subtitle,
              style: AppTextStyles.r400grey10.copyWith(fontSize: 12.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      // child: Container(
      //   padding: EdgeInsets.all(20.w),
      //   decoration: BoxDecoration(
      //     color: AppColors.black2Color,
      //     borderRadius: BorderRadius.circular(20.r),
      //     border: Border.all(color: AppColors.greyColor,width: 2.w
      //     ),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: 50.r,
      //         width: 50.r,
      //         decoration: BoxDecoration(
      //             color: feature.color.withOpacity(0.15),
      //             borderRadius: BorderRadius.circular(14.r),
      //             border: Border.all(color: feature.color,width: 1.5.w),
      //           boxShadow: [
      //             BoxShadow(
      //                 color: feature.color.withOpacity(0.3),
      //                 spreadRadius: 5.r,
      //               blurRadius: 100.r
      //             )
      //           ]
      //         ),
      //         child: Icon(
      //           feature.icon,
      //           color: feature.color,
      //           size: 28.r,
      //         ),
      //       ),
      //       SizedBox(height: 16.h),
      //       Text(
      //         feature.title,
      //         style: AppTextStyles.m500black16.copyWith(color: AppColors.offWhiteColor),
      //         maxLines: 1,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //       SizedBox(height: 4.h),
      //       Text(
      //         feature.subtitle,
      //         style: AppTextStyles.r400grey10.copyWith(fontSize: 12.sp,color: AppColors.offWhiteColor),
      //         maxLines: 1,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //     ],
      //   ),
      // ),

    );
  }
}
