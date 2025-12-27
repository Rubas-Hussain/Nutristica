import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_text_field.dart';
import '../../../utils/app_colors.dart';

class FoodSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const FoodSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
    widget.onChanged(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Search for foods...',
      prefixIcon: Padding(
        padding: EdgeInsets.all(12.r),
        child: Icon(
          LucideIcons.search,
          color: AppColors.greyColor,
          size: 20.r,
        ),
      ),
      suffixIcon: widget.controller.text.isNotEmpty
          ? InkWell(
              onTap: () {
                widget.controller.clear();
                widget.onChanged('');
              },
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Icon(
                  LucideIcons.x,
                  color: AppColors.greyColor,
                  size: 20.r,
                ),
              ),
            )
          : null,
    );
  }
}

