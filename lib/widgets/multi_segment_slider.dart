import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/app_textstyles.dart';


class MultiSegmentSlider<T> extends StatefulWidget {
  final T initialValue;
  final Map<T, Widget> children;
  final BoxDecoration decoration;
  final BoxDecoration thumbDecoration;
  final Duration duration;
  final Curve curve;
  final ValueChanged<T> onValueChanged;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const MultiSegmentSlider({
    super.key,
    required this.initialValue,
    required this.children,
    required this.decoration,
    required this.thumbDecoration,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    required this.onValueChanged,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  State<MultiSegmentSlider<T>> createState() =>
      _MultiSegmentSlidingControlState<T>();
}

class _MultiSegmentSlidingControlState<T>
    extends State<MultiSegmentSlider<T>> {
  late T selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final keys = widget.children.keys.toList();
    final selectedIndex = keys.indexOf(selectedValue);
    final segmentCount = keys.length;

    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentWidth = constraints.maxWidth / segmentCount;

        return Container(
          height: 45,
          decoration: widget.decoration,
          child: Stack(
            children: [
              // Sliding thumb with pixel-perfect alignment
              AnimatedPositioned(
                duration: widget.duration,
                curve: widget.curve,
                left: selectedIndex * segmentWidth,
                top: 4,
                bottom: 4,
                width: segmentWidth,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: widget.thumbDecoration,
                ),
              ),
              // Segments
              Row(
                children: keys.map((key) {
                  final isSelected = key == selectedValue;
                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (selectedValue != key) {
                            selectedValue = key;
                            widget.onValueChanged(key);
                        }
                      },
                      child: Center(
                        child: DefaultTextStyle(
                          style: AppTextStyles.r400black14.copyWith(
                            color: isSelected
                                ? widget.selectedTextColor
                                : widget.unselectedTextColor,
                          ),
                          child: widget.children[key]!,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
