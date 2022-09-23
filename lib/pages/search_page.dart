import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   GlobalKey <FormState> formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Consumer<ApiManager>(
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
                     onChanged: (data ) async{provider.valueTextFormField=data;
                     WeatherService weatherService = WeatherService();
                     provider.setWeatherModel=  await weatherService.getWeather(cityName:data) ;
                     setState(() {});
                     },
                     onFieldSubmitted: (va) {
                       if(formKey.currentState!.validate() ==true) {
                         Navigator.pop(context);
                       }
                     } ,

            ),
                 ),
               ),
             ),
            );
      }
    );
      }
  }
