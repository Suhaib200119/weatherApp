import 'package:flutter/material.dart';
import 'package:weatherstack/Shared/Style/styles.dart';

Widget buildContianer(Map dataMap) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("observation_time",style: textStyle,),
            Text("temperature",style: textStyle,),
            Text("wind_speed",style: textStyle,),
            Text("wind_degree",style: textStyle,),
            Text("wind direction",style: textStyle,),
            Text("humidity",style: textStyle,),
            Text("cloudcover",style: textStyle,),
            Text("visibility",style: textStyle,),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${dataMap["observation_time"].toString()}",style: textStyle,),
            Text("${dataMap["temperature"].toString()}",style: textStyle,),
            Text("${dataMap["wind_speed"].toString()}",style: textStyle,),
            Text("${dataMap["wind_degree"].toString()}",style: textStyle,),
            Text("${dataMap["wind_dir"].toString()}",style: textStyle,),
            Text("${dataMap["humidity"].toString()}",style: textStyle,),
            Text("${dataMap["cloudcover"].toString()}",style: textStyle,),
            Text("${dataMap["visibility"].toString()}",style: textStyle,),
          ],
        ),
      ],
    ),
  );
}
Widget buileItemWindData(
    {required String dataName ,
      required Map dataMap,
      required String key,
      required String nameImage,
      required TextStyle style}){
  return Column(
    children: [
      Text("$dataName",style: style,),
      SizedBox(height: 5,),
      Image(
        image: AssetImage("assets/images/"+"$nameImage"),
        width: 30,
        height: 30,
        color: Colors.white,
      ),
      SizedBox(height: 5,),
      Text("${dataMap["$key"]}",style: style,),
    ],
  );
}
Widget buildeDivider(){
  return Container(
    color: Colors.white,
    height: 90,
    width: 1,
  );
}


