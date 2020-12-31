import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retgoo_kick_off/providers/jadwal_sholat_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Jadwal Shalat'),
          onTap: () {
            Navigator.pushNamed(context, '/jadwal-shalat');
          },
        )
      ],
    );
  }
}
