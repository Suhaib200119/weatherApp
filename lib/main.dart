import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherstack/Shared/Network/remote/DioHelper.dart';
import 'package:weatherstack/Lauout/HomePage.dart';

void main() {
  DioHelper.initilizeDio();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(0, 150, 199, 0.5),
            statusBarIconBrightness: Brightness.dark,
          )
        )
      ),
      home:  new HomePage(),
    );
  }
}


