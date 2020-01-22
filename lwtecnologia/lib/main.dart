import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lwtecnologia/ui/account_screen.dart';
import 'package:lwtecnologia/ui/item_car.dart';
import 'package:lwtecnologia/ui/login_screen.dart';
import 'package:lwtecnologia/ui/main_pages.dart';
import 'package:lwtecnologia/ui/search_screen.dart';
import 'package:lwtecnologia/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'bloc/prefs_theme.dart';
import 'bloc/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Lw());
}

class Lw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(
        PrefsTheme.singleton().getTheme() != "Dark"
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      initialRoute: SplashScreen.id,
      routes: {
        AccountScreen.id: (context) => AccountScreen(),
        MainPages.id: (context) => MainPages(),
        SearchScreen.id: (context) => SearchScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        ItemCar.id: (context) => ItemCar(),
      },
    );
  }
}
