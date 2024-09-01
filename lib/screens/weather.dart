import 'package:flutter/material.dart';
import 'package:flutter_test_app_1/components/navbar.dart';
import 'package:flutter_test_app_1/services/weather.service.dart';
import 'package:location/location.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  Future<dynamic> weatherData = Future.value(null);
  String city = 'Kyiv';

  late final myController = TextEditingController(text: city);

  void checkWeather(String cityName) {
    try {
      setState(() {
        weatherData = WeatherService.getCurrentLocationWeather(cityName);
      });
    } catch (e) {
      weatherData = Future.value(null);
    }
  }

  @override
  void initState() {
    super.initState();
    checkWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: const Navbar(title: 'Weather'),
      body: Center(
        child: FutureBuilder(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: myController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Location',
                        ),
                        onChanged: (value) {
                          setState(() {
                            city = value;
                          });
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          checkWeather(city);
                        },
                        child: const Text('Check weather')),
                    snapshot.data['error'] == null
                        ? Column(children: [
                            Text(
                              snapshot.data['location']['name'],
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                                snapshot.data['current']['condition']['icon']),
                            Text(snapshot.data['current']['condition']['text']),
                            Text(
                                "Temperature is ${snapshot.data['current']['temp_c'].toString()} °C")
                          ])
                        : const Text('City not found'),
                  ],
                );
              }
            }),
      ),
    );
  }
}
