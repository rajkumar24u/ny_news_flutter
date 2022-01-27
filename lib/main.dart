import 'package:flutter/material.dart';
import 'package:nt_news/src/config/routes/app_routes.dart';

import 'Injector.dart';

void main() {
  initializeDependancies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: mostPopularArticle,
    );
  }
}

