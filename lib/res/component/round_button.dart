import 'package:flutter/material.dart';
import 'package:provider_test/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;

  final bool loading;

  final VoidCallback onPress;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 209,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    ); // Container
  }
}
