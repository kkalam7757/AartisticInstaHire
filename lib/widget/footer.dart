import 'package:flutter/material.dart';

class footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            ' | ',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Terms',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            ' | ',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Privacy',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            ' | ',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'About',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }
}
