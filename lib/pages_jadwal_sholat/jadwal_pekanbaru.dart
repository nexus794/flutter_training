import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/api/jadwal_sholat.dart';
import 'package:retgoo_kick_off/models/jadwal_sholat.dart';

class JadwalSholatPekanBaru extends StatefulWidget {
  @override
  _JadwalSholatPekanBaruState createState() => _JadwalSholatPekanBaruState();
}

class _JadwalSholatPekanBaruState extends State<JadwalSholatPekanBaru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Sholat Pekan Baru'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    final tanggal = DateTime.now();
    return FutureBuilder<Response>(
      future: jadwalSholatApi.get(
          'pekanbaru/${tanggal.year}/${tanggal.month}/${tanggal.day}.json'),
      builder: (context, snapshot) {
        //final subuh = (snapshot.data.data).toString();
        var data = json.decode(snapshot.data.data);
        var jadwal = Jadwal.fromJson(data);
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Tanggal : " +
                        tanggal.year.toString() +
                        "/" +
                        tanggal.month.toString() +
                        "/" +
                        tanggal.day.toString(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Imsyak : " + jadwal.imsyak,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Subuh : " + jadwal.shubuh,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Terbit : " + jadwal.terbit,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Dhuha : " + jadwal.dhuha,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Dzuhur : " + jadwal.dzuhur,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Ashar : " + jadwal.ashr,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Magrib : " + jadwal.magrib,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(26, 16, 26, 6),
                  child: Text(
                    "Isya : " + jadwal.isya,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
