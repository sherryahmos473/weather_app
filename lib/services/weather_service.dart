
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'dd9dcec81cfc454ea1e143230232911';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      
      return weatherModel;

    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
       'opps there was an error please try later';
      throw Exception(errorMessage);
    }catch(e)
    {
      log(e.toString());
      throw Exception('opps there was an error please try later');
    }
  }
}
