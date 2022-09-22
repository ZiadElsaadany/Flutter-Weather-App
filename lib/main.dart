
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/provider.dart';
import 'package:weather_app/pages/home_page.dart';

void main () {
  runApp(
      ChangeNotifierProvider(create: (context) => ApiManager(), child:MyApp()  )
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage( ),
    );
  }
}