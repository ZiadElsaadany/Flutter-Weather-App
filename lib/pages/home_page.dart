import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // List<String> time= Provider.of<ApiManager>(context,listen: false).weatherModel.date.split(' ') ;
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
                 const SearchPage()
                ) );
              }),
            )],
          ),
          body: provider.getWeatherModel ==null ? Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
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
              const Spacer(flex: 3, ) ,
              Text(provider.valueTextFormField ??'' , style: const TextStyle( fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text('updated: ${provider.getWeatherModel.date ?? ''}', style: const TextStyle( fontSize: 22),),
              const Spacer( ) ,
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${provider.getWeatherModel.icon}'),
                  Text( '${provider.getWeatherModel.temp ??'' }', style: const TextStyle( fontSize: 30,fontWeight: FontWeight.bold)) ,
                  Column( children: [Text( 'minTemp: ${provider.getWeatherModel.minTemp ?? ''}'),
                    Text('maxTemp:${provider.getWeatherModel.maxTemp ?? ''}')],),
                ],

              ),
              const Spacer( ),
              Text('${provider.getWeatherModel.weatherStateName ?? ''}', style: const TextStyle( fontSize: 30,fontWeight: FontWeight.bold),),
              const Spacer(flex: 5, )
            ],
          )
          ,
        );
      }
    );
  }
}
