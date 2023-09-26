import 'package:app1/cubits/weathercubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../models/weathermodel.dart';
import '../providers/weatherprovider.dart';
import '../services/weatherservice.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
               cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context).getweather(cityname: cityName);

              BlocProvider.of<WeatherCubit>(context).cityname=cityName;

             

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(
                
                onTap : () async 
                {
                    WeatherService service = WeatherService();

              WeatherModel? weather =
            await service.getWeather(cityName: cityName!);

            //  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                       //s    Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
                },
                child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

