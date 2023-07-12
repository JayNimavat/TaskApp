import 'package:flutter/material.dart';
import 'package:task/pages/weather_homePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: WeatherHome(),
      ),
      body: Center(
        child: Text(
          " Hello Developer...!",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
