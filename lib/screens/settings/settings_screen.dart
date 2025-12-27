import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/settings/widgets/settings_option_tile.dart';
import 'package:nutritionist_app/screens/settings/widgets/settings_section.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../widgets/decorated_background_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                  NavigationHeaderWidget(title: 'Settings', showBackIcon: true),
                  SizedBox(height: 30.h),
                  SettingsSection(
                    title: 'Account',
                    children: [
                      SettingsOptionTile(
                        icon: LucideIcons.user,
                        title: 'Profile Settings',
                        subtitle: 'Manage your profile information',
                        onTap: () {
                          // Navigate to profile settings
                        },
                      ),
                      SettingsOptionTile(
                        icon: LucideIcons.lock,
                        title: 'Privacy & Security',
                        subtitle: 'Password and privacy settings',
                        onTap: () {
                          // Navigate to privacy settings
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // SettingsSection(
                  //   title: 'Preferences',
                  //   children: [
                  //     SettingsOptionTile(
                  //       icon: LucideIcons.bell,
                  //       title: 'Notifications',
                  //       subtitle: 'Manage notification preferences',
                  //       onTap: () {
                  //         // Navigate to notification settings
                  //       },
                  //     ),
                  //     SettingsOptionTile(
                  //       icon: LucideIcons.moon,
                  //       title: 'Appearance',
                  //       subtitle: 'Theme and display settings',
                  //       onTap: () {
                  //         // Navigate to appearance settings
                  //       },
                  //     ),
                  //     SettingsOptionTile(
                  //       icon: LucideIcons.globe,
                  //       title: 'Language',
                  //       subtitle: 'English (US)',
                  //       onTap: () {
                  //         // Navigate to language settings
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 24.h),
                  SettingsSection(
                    title: 'Units',
                    children: [
                      SettingsOptionTile(
                        icon: LucideIcons.scale,
                        title: 'Weight Unit',
                        subtitle: 'Kilograms (kg)',
                        onTap: () {
                          // Navigate to weight unit settings
                        },
                      ),
                      SettingsOptionTile(
                        icon: LucideIcons.ruler,
                        title: 'Height Unit',
                        subtitle: 'Centimeters (cm)',
                        onTap: () {
                          // Navigate to height unit settings
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SettingsSection(
                    title: 'Support',
                    children: [
                      SettingsOptionTile(
                        icon: LucideIcons.helpCircle,
                        title: 'Help Center',
                        subtitle: 'Get help and support',
                        onTap: () {
                          // Navigate to help center
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SettingsSection(
                    title: 'About',
                    children: [
                      SettingsOptionTile(
                        icon: LucideIcons.fileText,
                        title: 'Terms & Conditions',
                        subtitle: 'Read our terms and conditions',
                        onTap: () {
                          // Navigate to terms
                        },
                      ),
                      SettingsOptionTile(
                        icon: LucideIcons.shield,
                        title: 'Privacy Policy',
                        subtitle: 'How we handle your data',
                        onTap: () {
                          // Navigate to privacy policy
                        },
                      ),
                      SettingsOptionTile(
                        icon: LucideIcons.info,
                        title: 'App Version',
                        subtitle: '1.0.0',
                        showTrailing: false,
                        onTap: () {},
                      ),
                    ],
                  ),
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

