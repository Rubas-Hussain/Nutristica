// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:nutritionist_app/utils/responsive_util.dart';
//
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_textstyles.dart';
// import '../../../utils/assets.dart';
//
// class ProgressHeaderWidget extends StatelessWidget {
//   const ProgressHeaderWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 55.h,
//
//       child: Row(
//         children: [
//           // SizedBox(height: 5.h,),
//           Text(
//             'Progress',
//             style: AppTextStyles.m500black24.copyWith(
//               color: AppColors.black2Color,
//             ),
//           ),
//           Spacer(),
//           Container(
//             height: 40.h,
//             width:  40.w,
//             padding: EdgeInsets.all(5.r),
//             decoration: BoxDecoration(
//                 color: AppColors.offWhiteColor,
//                 borderRadius: BorderRadius.circular(12.r)
//             ),
//             child: SvgPicture.asset(Assets.notificationIcon),
//           )
//         ],
//       ),
//     );
//   }
// }
