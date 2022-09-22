import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> time= Provider.of<ApiManager>(context,listen: false).weatherModel!.date.split(' ') ;
    return Consumer<ApiManager>(
      builder: (context,provider,_ ) {
        return Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            title: const Text ( 'Weather App'  ),
            actions:  [Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(icon:const Icon(  Icons.search) , onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                 SearchPage()
                ) );
              }),
            )],
          ),
          body: provider.weatherModel==null ? Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: const Text(
                'There is no weather start searching now',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3, ) ,
              Text('${provider.valueTextFormField}', style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text('updated: ${time}', style: TextStyle( fontSize: 22),),
              Spacer( ) ,
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${provider.weatherModel?.icon}'),
                  Text( '${provider.weatherModel!.temp.toInt()}', style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold)) ,
                  Column( children: [Text( 'minTemp: ${provider.weatherModel!.minTemp}'),Text('maxTemp:${provider.weatherModel?.maxTemp}')],),
                ],

              ),
              Spacer( ),
              Text('${provider.weatherModel!.weatherStateName}', style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold),),
              Spacer(flex: 5, )
            ],
          )
          ,
        );
      }
    );
  }
}
