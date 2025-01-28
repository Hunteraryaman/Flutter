import 'package:flutter/material.dart';

class TextStyled extends StatelessWidget {
  const TextStyled(this.text, {super.key});//this.text is a shortcut the this keyword finds a text in the classs to which it asigns the value it gets

  final String text;//final can be used as this is just initialised once and never changed and string is used to not make it dynamic
//this text is an instanc3e variable
  @override
  Widget build(context) {
    return Text(
      text,
      // selectionColor: Colors.white,//this does not change the color of the text
      style: const TextStyle(
          color: Colors
              .white, //thius is what i need to do to chanfe the colout of the text
          fontSize: 28), //this for size
      // strutStyle: StrutStyle(fontSize: f),//this is for some struct not for normal data type
      // textScaler: TextScaler.linear(4),//this is a 4x of the previous one not a 28font
    );
    // throw UnimplementedError();
  }
}
