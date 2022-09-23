
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiManager extends ChangeNotifier {
   WeatherModel    ? _weatherModel  ;
     String  ?valueTextFormField;
  set setWeatherModel(WeatherModel weatherModel   ){
   _weatherModel = weatherModel;
    notifyListeners();
  }
 get  getWeatherModel{
    return _weatherModel;
  }

}