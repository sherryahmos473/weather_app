import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart ';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition != null) log(condition.toString());
  if (condition == null) {
    return Colors.blue;
  } else if (condition == 'Sunny' ||
      condition == 'Clear' ||
      condition == 'Partly cloudy') {
    return Colors.orange;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey;
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.blueGrey;
  } else if (condition == 'Light snow' ||
      condition == 'Moderate snow' ||
      condition == 'Patchy light snow' ||
      condition == 'Patchy moderate snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Heavy snow' ||
      condition == 'Light snow showers' ||
      condition == 'Moderate or heavy snow showers' ||
      condition == 'Blowing snow' ||
      condition == 'Blizzard') {
    return Colors.grey;
  } else if (condition == 'Light rain shower' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Torrential rain shower' ||
      condition == 'Light sleet showers' ||
      condition == 'Moderate or heavy sleet showers' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate or heavy showers of ice pellets' ||
      condition == 'Patchy rain possible' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible') {
    return Colors.lightBlue;
  } else if (condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder' ||
      condition == 'Thundery outbreaks possible') {
    return Colors.deepPurple;
  } else {
    return Colors.blue;
  }
}
