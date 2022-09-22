class WeatherModel {

  String  date;
  double  temp ;
  double  maxTemp;
  double  minTemp;
  String  weatherStateName ;
  String icon ;
  WeatherModel(   {  
    required this.date ,
    required this.temp , 
    required this.maxTemp , 
    required this.minTemp , 
    required this.weatherStateName,
    required this.icon
}  );
  factory WeatherModel.fromJson(dynamic data) {

    var jsonData = data['forecast']['forecastday'][0]['day'] ;

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        icon:jsonData['condition']['icon']
    ) ;
  }
}