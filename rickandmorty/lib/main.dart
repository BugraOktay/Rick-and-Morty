import 'package:flutter/material.dart';
import 'package:rickandmorty/app_state.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/core/router.dart';
import 'package:rickandmorty/core/theme.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppState())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
