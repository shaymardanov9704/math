import 'package:flutter/material.dart';
import 'package:math/presentation/utils/colors.dart';
import 'package:math/presentation/utils/text_styles.dart';

class NumberButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  const NumberButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        child,
        style: AppTextStyles.style600.copyWith(fontSize: 22,color: AppColors.white),
      ),
    );
  }
}
