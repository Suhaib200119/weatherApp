import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherstack/Shared/Cubit/AppStates.dart';
import 'package:weatherstack/Shared/Network/remote/DioHelper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialStateClass());

  static AppCubit getObjectFromAppCubit(context){
    return BlocProvider.of(context);
  }

  Map jerusalemWeatherMap={};
  Map jerusalemWeatherLocationMap={};

  void getJerusalemWeather(){
    DioHelper.getData(
        path: "current",
        query: {
          "access_key":"58bfe10f56b91e08bb52ce08a07a97aa",
          "query":"Jerusalem"
        }
    ).then((value){
      jerusalemWeatherMap=value.data["current"];
      jerusalemWeatherLocationMap=value.data["location"];

      emit(GetJerusalemWeatherStateClass());
    }).catchError((error){
      print("ERROR-API : ${error.toString()}");
    });
  }
}
