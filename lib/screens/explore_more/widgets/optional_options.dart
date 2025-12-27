import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/explore_more/widgets/optional_tile.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

class OptionalOptions extends StatelessWidget {
  const OptionalOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionalTile(
          icon: LucideIcons.helpCircle,
          title: 'Help & Support',
          subtitle: 'Get assistance',
          onTap: () {
            // Navigate to help screen
          },
        ),
        SizedBox(height: 12.h),
        OptionalTile(
          icon: LucideIcons.info,
          title: 'About',
          subtitle: 'App information',
          onTap: () {
            // Navigate to about screen
          },
        ),
        SizedBox(height: 12.h),
        OptionalTile(
          icon: LucideIcons.share2,
          title: 'Share App',
          subtitle: 'Share with friends',
          onTap: () {
            // Share app functionality
          },
        ),
      ],
    );
  }
}
