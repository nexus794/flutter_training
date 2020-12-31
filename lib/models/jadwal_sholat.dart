import 'dart:convert';

class Jadwal {
  Jadwal({
    this.tanggal,
    this.imsyak,
    this.shubuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashr,
    this.magrib,
    this.isya,
  });

  DateTime tanggal;
  String imsyak;
  String shubuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashr;
  String magrib;
  String isya;

  factory Jadwal.fromRawJson(String str) => Jadwal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        imsyak: json["imsyak"] == null ? null : json["imsyak"],
        shubuh: json["shubuh"] == null ? null : json["shubuh"],
        terbit: json["terbit"] == null ? null : json["terbit"],
        dhuha: json["dhuha"] == null ? null : json["dhuha"],
        dzuhur: json["dzuhur"] == null ? null : json["dzuhur"],
        ashr: json["ashr"] == null ? null : json["ashr"],
        magrib: json["magrib"] == null ? null : json["magrib"],
        isya: json["isya"] == null ? null : json["isya"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal == null
            ? null
            : "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "imsyak": imsyak == null ? null : imsyak,
        "shubuh": shubuh == null ? null : shubuh,
        "terbit": terbit == null ? null : terbit,
        "dhuha": dhuha == null ? null : dhuha,
        "dzuhur": dzuhur == null ? null : dzuhur,
        "ashr": ashr == null ? null : ashr,
        "magrib": magrib == null ? null : magrib,
        "isya": isya == null ? null : isya,
      };
}
