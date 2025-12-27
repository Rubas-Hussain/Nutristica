import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/profile/widgets/info_tile.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        InfoTile(
          icon: LucideIcons.phone,
          title: 'Phone Number',
          value: '+1 234 567 8900',
        ),
        SizedBox(height: 12.h),
        InfoTile(
          icon: LucideIcons.calendar,
          title: 'Date of Birth',
          value: 'January 15, 1996',
        ),
        SizedBox(height: 12.h),
        InfoTile(
          icon: LucideIcons.users,
          title: 'Gender',
          value: 'Male',
        ),
        SizedBox(height: 12.h),
        InfoTile(
          icon: LucideIcons.mapPin,
          title: 'Location',
          value: 'New York, USA',
        ),
      ],
    );
  }
}
