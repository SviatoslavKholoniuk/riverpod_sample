import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/resources/colors.dart';
import '../../../../common/resources/images.dart';
import '../../../../routes/app_route.dart';
import 'provider/splash_notifier.dart';
import 'provider/splash_state.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(splashNotifier, (previous, next) {
      _handleSplashEvents(context, next);
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashLogo.assetName,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

  void _handleSplashEvents(BuildContext context, SplashState? event) {
    if (event == null) return;

    if (event == SplashState.unauthenticated) {
      context.router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (_) => false,
      );
    } else if (event == SplashState.authenticated) {
      context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );
    }
  }
}
