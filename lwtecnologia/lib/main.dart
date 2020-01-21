import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lwtecnologia/ui/account_screen.dart';
import 'package:lwtecnologia/ui/login_screen.dart';
import 'package:lwtecnologia/ui/main_pages.dart';
import 'package:lwtecnologia/ui/search_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      initialRoute: MainPages.id,
      routes: {
        AccountScreen.id: (context) => AccountScreen(),
        MainPages.id: (context) => MainPages(),
        SearchScreen.id: (context) => SearchScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
