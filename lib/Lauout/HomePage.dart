import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherstack/Shared/Component/Components.dart';
import 'package:weatherstack/Shared/Cubit/AppCubit.dart';
import 'package:weatherstack/Shared/Cubit/AppStates.dart';
import 'package:weatherstack/Shared/Style/styles.dart';

class HomePage extends StatelessWidget {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (ctx) {
        return AppCubit()..getJerusalemWeather();
      },
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (ctx, stste) {
            AppCubit appCubitObject = AppCubit.getObjectFromAppCubit(ctx);
            return Scaffold(
              body: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                width: double.infinity,
                height: double.infinity,
                color: Color.fromRGBO(0, 150, 199, 0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${DateFormat('EEEE, d MMM, yyyy').format(dateTime)}",
                      style: setStyle(fontSize: 18, isBold: false),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${DateFormat.jm().format(dateTime)}",
                      style: setStyle(fontSize: 24, isBold: false),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${appCubitObject.jerusalemWeatherLocationMap["name"]}",
                      style: setStyle(fontSize: 18, isBold: false),
                    ),
                    Image(
                      image: AssetImage("assets/images/weatherLogo.png"),
                      width: 350,
                      height: 350,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${appCubitObject.jerusalemWeatherMap["temperature"]}",
                          style: setStyle(fontSize: 40, isBold: true),
                        ),
                        Text(
                          "C",
                          style: setStyle(fontSize: 28, isBold: false),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${DateFormat('EEEE').format(dateTime)}",
                            style: setStyle(fontSize: 24, isBold: false),
                          ),
                          Container(
                            width: 250,
                            child: Divider(
                              height: 10,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buileItemWindData(
                                dataName: "wind_speed",
                                dataMap: appCubitObject.jerusalemWeatherMap,
                                key:"wind_speed",
                                nameImage: "speed.png" ,
                                style:setStyle(fontSize: 18,isBold: false),
                              ),
                              buildeDivider(),
                              buileItemWindData(
                                dataName: "wind_degree",
                                dataMap: appCubitObject.jerusalemWeatherMap,
                                key:"wind_degree",
                                nameImage: "wind_degree.png",
                                style:setStyle(fontSize: 18,isBold: false),
                              ),
                              buildeDivider(),
                              buileItemWindData(
                                dataName: "wind_dir",
                                dataMap: appCubitObject.jerusalemWeatherMap,
                                key:"wind_dir",
                                nameImage: "wind.png",
                                style:setStyle(fontSize: 18,isBold: false),
                              ),
                              buildeDivider(),
                              buileItemWindData(
                                dataName: "visibility",
                                dataMap: appCubitObject.jerusalemWeatherMap,
                                key:"visibility",
                                nameImage: "visibility.png",
                                style:setStyle(fontSize: 18,isBold: false),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (ctx, stste) {}),
    );
  }
}
