import 'package:cat_app/src/core/navigation/app_router.dart';
import 'package:cat_app/src/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAW dex',
      routes: appRouter(),
      initialRoute: AppRoutes.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
