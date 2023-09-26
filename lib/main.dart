import 'package:app1/cubits/weathercubit.dart';
import 'package:app1/pages/homepage.dart';
import 'package:app1/providers/weatherprovider.dart';
import 'package:app1/services/weatherservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(BlocProvider(
     
    create: (BuildContext context) { 
      return WeatherCubit();
     },
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
     // primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
