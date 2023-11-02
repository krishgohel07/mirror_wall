import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/connectivity_provider.dart';
import 'package:mirror_wall/provider/entertainment_provider.dart';
import 'package:mirror_wall/provider/webiste_provider.dart';
import 'package:mirror_wall/view/entertainment_web_view.dart';
import 'package:mirror_wall/view/home_page.dart';
import 'package:mirror_wall/view/web_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => entertainmentprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => websiteProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ConnectivityProvider(),
      )
    ],
    builder: (context, _) => MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => const HomePage(),
        'webpage': (context) => const WebView(),
        'entertainment': (context) => const SecondWebView(),
      },
    ),
  ));
}
