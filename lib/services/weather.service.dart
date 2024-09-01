import 'dart:async';
import 'dart:convert';

import 'package:flutter_test_app_1/services/constants.dart';
import 'package:http/http.dart' as http;

String apiKey = 'c8a6e858de594343813151804243008';

class WeatherService {
  static Future<dynamic> getCurrentLocationWeather(String city) async {
    final response = await http.post(Uri.parse(
        "${Endpoint.baseWeatherUrl}/current.json?key=$apiKey&q=$city"));

    return jsonDecode(response.body);
  }
}
