import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/api/jadwal_sholat.dart';

class JadwalSholatMalang extends StatefulWidget {
  JadwalSholatMalang({Key key}) : super(key: key);

  @override
  _JadwalSholatMalangState createState() => _JadwalSholatMalangState();
}

class _JadwalSholatMalangState extends State<JadwalSholatMalang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Sholat Malang'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    final tanggal = DateTime.now();
    return FutureBuilder<Response>(
      future: jadwalSholatApi
          .get('malang/${tanggal.year}/${tanggal.month}/${tanggal.day}.json'),
      builder: (context, snapshot) {
        final response = snapshot.data;
        return Container();
      },
    );
  }
}
