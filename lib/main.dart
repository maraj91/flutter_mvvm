import 'package:flutter/material.dart';
import 'package:project/models/moviesList/MoviesMain.dart';
import 'package:project/view/details/MovieDetailsScreen.dart';
import 'package:project/view/home/HomeScreen.dart';
import 'package:project/res/AppContextExtension.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
        accentColor: context.resources.color.colorAccent,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        MovieDetailsScreen.id : (context) => MovieDetailsScreen(ModalRoute.of(context)!.settings.arguments as Movie),
      },
    );
  }
}
