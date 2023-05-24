import 'package:auto_route/auto_route.dart';

import '../features/auth/presentation/ui/login/login_screen.dart';
import '../features/auth/presentation/ui/signup/signup_screen.dart';
import '../features/home/presentation/ui/home_screen.dart';
import '../features/splash/presentation/ui/splash_screen.dart';

part 'app_route.gr.dart';

MainAppRouter autoRouter = MainAppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MainAppRouter extends _$MainAppRouter {
  @override
  List<AutoRoute> get routes => [
        // auth flow
        CustomRoute(
          path: '/splash',
          page: SplashRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/login',
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/signup',
          page: SignUpRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        // home flow
        CustomRoute(
          path: '/home',
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
