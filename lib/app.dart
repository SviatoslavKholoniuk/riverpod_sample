import 'package:flutter/material.dart';

import 'routes/app_route.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TestApp',
      locale: const Locale('en', ''),
      routerConfig: autoRouter.config(),
      theme: ThemeData(
        useMaterial3: true,
      ),
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        final data = MediaQuery.of(context);

        return MediaQuery(
          data: data.copyWith(),
          child: child,
        );
      },
    );
  }
}
