import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
              // enabled: true,
              // style: TextStyle(height: 2),
              // onChanged: (String value) {
              //   log(value);
              // },
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                hintText: 'Enter a city name',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(
                  Icons.search,
                ),
                label: const Text('Search a City'),
                // icon: const Icon(
                //   Icons.search,
                //   color: Colors.orange,
                // ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                  ),
                ),
                // enabledBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.orange),
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.green),
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
              ),
            ),
          ),
        ));
  }
}