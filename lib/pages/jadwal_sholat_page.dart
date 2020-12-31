import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retgoo_kick_off/providers/jadwal_sholat_provider.dart';

class JadwalSholatPage extends StatelessWidget {
  const JadwalSholatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Sholat'),
      ),
      body: Consumer<JadwalSholatProvider>(
        builder: (context, provider, child) {
          final tanggal = DateTime.now();
          final jadwal = provider.jadwalHariIni;

          return Center(
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
          );
        },
      ),
    );
  }
}
