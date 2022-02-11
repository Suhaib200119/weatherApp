import 'package:flutter/material.dart';

TextStyle textStyle=new TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle setStyle({required double fontSize,isBold = true}){
  return TextStyle(
      fontSize: fontSize,
      fontWeight:isBold==true? FontWeight.w900:FontWeight.normal,
      color: Colors.white
  );

}