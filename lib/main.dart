
import 'package:aartistic/pages/router.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aartistic/pages/welocme.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        title: 'Flutter layout demo',
        theme: ThemeData(
          fontFamily: 'Regular',
          backgroundColor: Color(0xfff9fdff)
        ),
        builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
        navigatorKey: locator<NavigationService>().navigationKey,
        home : Welcome(),
        onGenerateRoute:generateRoute,
    );
  }
}