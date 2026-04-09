import 'package:flutter/material.dart';
import 'package:mkulima_exchange/core/constants/app_constants.dart';
import 'package:mkulima_exchange/core/theme/app_theme.dart';
import 'package:mkulima_exchange/router.dart';

void main() {
  runApp(const MkulimaExchangeApp());
}

/// Main Mkulima Exchange App Widget
class MkulimaExchangeApp extends StatelessWidget {
  const MkulimaExchangeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
