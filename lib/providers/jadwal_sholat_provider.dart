import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/api/jadwal_sholat.dart';
import 'package:retgoo_kick_off/models/jadwal_sholat.dart';

class JadwalSholatProvider with ChangeNotifier {
  Jadwal jadwalHariIni;

  JadwalSholatProvider() {
    getJadwal();
  }

  Future<Jadwal> getJadwal() async {
    print('Mengambil data dari API');

    final tanggal = DateTime.now();

    final response = await jadwalSholatApi.get(
      'pekanbaru/${tanggal.year}/${tanggal.month}/${tanggal.day}.json',
    );

    var data = json.decode(response.data);
    jadwalHariIni = Jadwal.fromJson(data);
    notifyListeners();

    return jadwalHariIni;
  }
}
