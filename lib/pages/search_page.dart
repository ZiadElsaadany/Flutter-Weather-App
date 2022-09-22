import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
   GlobalKey <FormState> formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(
      builder: (context,provider,_) {
        return Scaffold(
 appBar: AppBar( title: const Text('Search a City'),),
         body: Center(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Form(
               key: formKey,
               child: TextFormField(
                 decoration: InputDecoration(
                   contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                   labelText: 'Search' ,
                   hintText: 'Enter City Name',
                   suffixIcon: IconButton(onPressed: () async{
                     if(formKey.currentState!.validate() ==true) {
                       WeatherService weatherService = WeatherService();
                      provider.weatherModel  = await weatherService.getWeather(cityName: provider.valueTextFormField.toString());
                       Navigator.pop(context);
                     }
                   } ,  icon: const Icon(Icons.search)),
                   border: const OutlineInputBorder( ),

                 ),
                 validator: (value ) {
                   if( value == null || value.isEmpty ){
                     return  'Please enter a City Name';
                   }
                   return null;
                 },
                 onFieldSubmitted: (data ) async{provider.valueTextFormField=data;
                 WeatherService weatherService = WeatherService();
                    WeatherModel weatherModel  = await weatherService.getWeather(cityName: provider.valueTextFormField.toString());
                 },

        ),
             ),
           ),
         ),
        );
      }
    );
  }
}
