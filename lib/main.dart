import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_back_app/screens/home_screen.dart';
import 'package:flutter_back_app/screens/main_screen.dart';

void main() async{
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
        runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Backpack App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'JosefinSans',
          ),
          home: MainScreen(),
      );
    }
}
