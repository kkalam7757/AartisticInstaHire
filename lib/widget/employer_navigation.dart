
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
class NavigationItem extends StatelessWidget {
  String title;
  IconData icon;
  Function onTab;
  NavigationItem(this.title,this.icon,this.onTab);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTab,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: [
              Icon(icon),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18.0),
                  ))
            ]),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
