import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/provider/provider.dart';
import 'package:math/di.dart';
import 'package:math/presentation/app/app.dart';
import 'package:math/presentation/pages/home_page.dart';
import 'package:math/presentation/pages/main/main_page.dart';
import 'package:provider/provider.dart';

import 'presentation/utils/themes.dart';

void main() async {
  runZonedGuarded(() async {
    await setup();
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(di.get())),
      ],
      child: App(
        hive: di.get(),
        enabledPreview: false,
        child: const MyApp(),
      ),
    ));
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: AppThemes.light(),
      darkTheme: AppThemes.dark(),
      home: const MainPage(),
    );
  }
}
