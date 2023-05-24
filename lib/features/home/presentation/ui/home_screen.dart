import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/resources/colors.dart';
import '../../../../common/resources/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text(
                'Home screen',
                style: AppTextStyle.titleMain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
