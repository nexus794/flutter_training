import 'package:dio/dio.dart';

final jadwalSholatApi = Dio(
  BaseOptions(
    baseUrl:
        'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/',
  ),
);
