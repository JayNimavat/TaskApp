import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:task/model/dataset.dart';
import 'package:task/pages/weather_detailPage.dart';
import 'package:task/pages/extraWeather.dart';

class WeatherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [CurrentWeather(), TodayWeather()],
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 270,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: Color(0xff00A1FF).withOpacity(0.5),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: Color(0xff00A1FF),
      spreadRadius: 5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.square_grid_2x2,
                color: Colors.white,
              ),
              /*  Row(
                children: [
                  //  Icon(CupertinoIcons.map_fill, color: Colors.white),
                  Text(
                    " ${currentTemp.location}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ), */
              Icon(Icons.more_vert, color: Colors.white)
            ],
          ),
          Container(
            //  margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                //  border: Border.all(width: 0.2, color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              " ${currentTemp.location}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: 330,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('${currentTemp.image}'),
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 1,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Column(
                      children: [
                        GlowText(
                          currentTemp.current.toString(),
                          style: TextStyle(
                              height: 0.1,
                              fontSize: 100,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${currentTemp.name}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '${currentTemp.day}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ExtraWeather(currentTemp)
        ],
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "7 days ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherWidget(todayWeather[0]),
                WeatherWidget(todayWeather[1]),
                WeatherWidget(todayWeather[2]),
                //  WeatherWidget(todayWeather[3])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            weather.current.toString() + "\u00B0",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage('${weather.image}'),
            width: 45,
            height: 45,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${weather.time}',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
