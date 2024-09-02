import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newapp/main.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures Flutter bindings are initialized
  await dotenv.load(); // Loads the .env file
  runApp(const MyApp());
}

class WeatherService {
  late final Dio _dio = Dio();
  late final String _apiKey;

  WeatherService() {
    _apiKey = dotenv.env['API_KEY'] ?? 'default_api_key';
  }

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'q': city,
          'APPID': _apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } catch (e) {
      return {'error': 'Failed to fetch weather data'};
    }
  }
}
