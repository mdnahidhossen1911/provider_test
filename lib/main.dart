import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/res/app_theme.dart';
import 'package:provider_test/service_locator.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/view_model/auth_view_model.dart';

import 'utils/routes/routes.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.login,
        theme: AppTheme.lightTheme,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
