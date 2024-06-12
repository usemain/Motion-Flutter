import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motion/controller/sysController.dart';
import 'package:motion/routes/index.dart';
import 'package:motion/screens/dashboard/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'natives/androidBackDesktop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initTheme();
  runApp(const App());
}

Future<void> _initTheme() async {
  String? theme = (await SharedPreferences.getInstance()).getString("Theme");
  Get.changeTheme(theme == 'Dark' ? ThemeData.dark() : ThemeData.light());
  Get.put(SysController((theme ?? 'Light').obs));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          await AndroidBackTop.backDeskTop();
        },
        child: const TabBarPage(),
      ),
      locale: const Locale('zh', 'CH'),
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      getPages: Routes.getPages,
    );
  }
}
