import 'package:flutter/material.dart';

import '../resources/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final Color? textColor;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(58),
            backgroundColor: color ?? const Color(0xFF17EFEF),
            foregroundColor: const Color(0xFF05D7D7),
            disabledForegroundColor: const Color(0xFFAAAAAA),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontSize: 16),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (isLoading) {
                  return const Color(0xFF17EFEF);
                }
                if (states.contains(MaterialState.disabled)) {
                  return const Color(0xFFAAAAAA);
                }
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xFF05D7D7);
                }
                return color ?? const Color(0xFF17EFEF);
              },
            ),
          ),
          child: Text(
            isLoading ? '' : title,
            style: AppTextStyle.bodyButton.copyWith(
              color: onPressed != null
                  ? const Color(0xFF000000)
                  : const Color(0xFF75767E),
            ),
          ),
        ),
        if (isLoading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF000000),
              ),
            ),
          ),
      ],
    );
  }
}
