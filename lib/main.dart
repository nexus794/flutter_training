import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retgoo_kick_off/pages/jadwal_sholat_page.dart';
import 'package:retgoo_kick_off/providers/jadwal_sholat_provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JadwalSholatProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
            )),
        routes: {
          '/': (context) => HomePage(),
          '/jadwal-shalat': (context) => JadwalSholatPage(),
        },
      ),
    );
  }
}
