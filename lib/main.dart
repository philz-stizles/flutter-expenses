import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';
import 'screens/screens.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, 
  //   DeviceOrientation.portraitDown
  // ]);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.indigo,
        fontFamily: 'Inter',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'Overpass',
            fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Overpass',
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            button: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ),
      home: HomeScreen(),
      routes: routes,
    );
  }
}
