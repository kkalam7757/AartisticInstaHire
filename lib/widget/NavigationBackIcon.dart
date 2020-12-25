
import 'package:flutter/material.dart';

class NavigationBackIcon extends StatelessWidget {
  final Function onPressed;

  const NavigationBackIcon({Key key, this.onPressed}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(
          Icons.keyboard_backspace,
          color: Color.fromRGBO(80, 170, 158, 1.0),
          size: 35,
        ), onPressed:onPressed);
  }
}