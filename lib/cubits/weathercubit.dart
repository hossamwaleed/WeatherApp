import 'package:app1/cubits/weatherstate.dart';
import 'package:app1/models/weathermodel.dart';
import 'package:app1/services/weatherservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit():super(WeatherInitialState());
WeatherService service=WeatherService();
WeatherModel? model;
String? cityname;
void getweather({ String? cityname})async{
  emit(Weatherloading());
try {
  model =await service.getWeather(cityName: cityname!);
  emit(WeatherSuccess());
} on Exception catch (e) {
  emit(Weatherfailed());
}
}
}
//