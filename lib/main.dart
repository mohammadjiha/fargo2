import 'package:device_preview/device_preview.dart';
import 'package:fargo/view/loading_screen/screen/loading_screen.dart';
import 'package:fargo/view/selct_language/screen/selct_language.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'l10n/app_local.dart';

void main() {
   runApp(DevicePreview(
      builder: (context) => ScopedModel<AppLocale>(
        model: AppLocale(),
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ScopedModelDescendant<AppLocale>(
          builder: (_, child, model) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              locale: AppLocale().myAppLocale,
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              routes: {
                '/': (context) => LoadingScreen(),
                LoadingScreen.routName: (context) => LoadingScreen(),
              },
            );

          });
      },
    );
  }
}
