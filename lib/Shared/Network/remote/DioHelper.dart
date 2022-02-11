import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static initilizeDio(){
    dio=new Dio(
      BaseOptions(
          baseUrl: "http://api.weatherstack.com/",
          receiveDataWhenStatusError: true,
      ),

    );
  }
 static Future<Response> getData({required String path,required Map<String,dynamic> query})async{
    return await dio.get(path,queryParameters: query);
  }


}