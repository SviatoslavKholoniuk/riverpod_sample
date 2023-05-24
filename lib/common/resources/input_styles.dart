import 'package:flutter/material.dart';
import 'package:riverpod_flutter/common/resources/text_styles.dart';

import 'colors.dart';

class InputStyles {
  static InputDecoration inputBaseDecoration = InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide.none,
    ),
    errorStyle: AppTextStyle.bodyLabel.copyWith(color: Colors.red),
    filled: true,
    fillColor: AppColors.bgSecondary,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
  );
}
