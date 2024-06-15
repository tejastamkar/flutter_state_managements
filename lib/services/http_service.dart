import 'dart:developer';

import 'package:dio/dio.dart';

class HTTPService {
  final Dio _dio = Dio();

  HTTPService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: "https://api.cryptorank.io/v1/",
      queryParameters: {
        "api_key":
            "bcb54f369c4b4934fc84aee3fb8b283c90593ed271a1ba435698fa3b3f85",
      },
    );
  }

  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
