import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newapp/screens/services/weather_services.dart';
import 'package:newapp/screens/weather_screen/weather_screen.dart';
import 'package:newapp/screens/widgets/extensions.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;
  String? _localTime;
  final String _city = 'Ibadan';

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  void _fetchWeather() async {
    final data = await _weatherService.fetchWeather(_city);
    setState(() {
      _weatherData = data;
      _localTime = _getLocalTime(data);
    });
  }

  String formatDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('EEEE, d MMMM').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return '$formattedDate $formattedTime';
  }

  String? _getLocalTime(Map<String, dynamic> weatherData) {
    final timezoneOffset = weatherData['timezone'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
        weatherData['dt'] * 1000,
        isUtc: true);

    final offsetHours = timezoneOffset ~/ 3600;

    final localDateTime = dateTime.add(Duration(hours: offsetHours));

    return formatDateTime(localDateTime);
  }

  Widget buildWeatherImage(String weatherCondition) {
    switch (weatherCondition) {
      case 'Rain':
        return Center(
          child: Image.asset(
            'rain'.toPNG(),
            height: 300,
          ),
        );
      case 'Clouds':
        return Center(
          child: Image.asset(
            'Cloud'.toPNG(),
            height: 300,
          ),
        );
      case 'ThunderStorm':
        return Center(
          child: Image.asset(
            'Thunder Cloud'.toPNG(),
            height: 300,
          ),
        );
      case 'Snow':
        return Center(
          child: Image.asset(
            'Snow Cloud'.toPNG(),
            height: 300,
          ),
        );
      case 'Clear':
        return Center(
          child: Image.asset(
            'Cloud'.toPNG(),
            height: 300,
          ),
        );
      case 'Drizzle':
        return Center(
          child: Image.asset(
            'drizzle'.toPNG(),
            height: 300,
          ),
        );
      default:
        return Center(
          child: Image.asset(
            'House'.toPNG(),
            height: 300,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Weather Forecast',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          minimum: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Container(
            height: 380,
            width: 330,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_localTime != null)
                    Center(
                      child: Text(
                        '$_localTime',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  10.vSpace,
                  _weatherData != null
                      ? (_weatherData!['error'] != null)
                          ? Center(
                              child: Text(
                              _weatherData!['error'],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ))
                          : Center(
                              child: Column(
                                children: [
                                  Text(
                                    '${_weatherData?['main']['temp']}°C',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 80,
                                      color: Colors.amberAccent,
                                    ),
                                  ),
                                  20.vSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.wind_power_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          20.vSpace,
                                          const Icon(
                                            Icons.water_drop_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          20.vSpace,
                                          const BoxedIcon(
                                            WeatherIcons.cloud,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      20.hSpace,
                                      Column(
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          20.vSpace,
                                          const Text('Hum',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                                color: Colors.white,
                                              )),
                                          20.vSpace,
                                          const Text('Weather',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                      20.hSpace,
                                      Column(
                                        children: [
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          20.vSpace,
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          20.vSpace,
                                          const Text(
                                            '|',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      20.hSpace,
                                      Column(
                                        children: [
                                          Text(
                                            '${_weatherData?['wind']['speed']}%',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          20.vSpace,
                                          Text(
                                            '${_weatherData?['main']['humidity']}%',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                          20.vSpace,
                                          Text(
                                            '${_weatherData?['weather'][0]['main']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                      : const Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.amberAccent,
                        )),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.vSpace,
                if (_weatherData != null)
                  _weatherData!['error'] != null
                      ? Text(_weatherData!['error'])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            10.hSpace,
                            Text(
                              '${_weatherData!['name']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              child: const Padding(
                                padding: EdgeInsets.only(left: 200),
                                child: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WeatherScreen(),
                                ));
                              },
                            ),
                          ],
                        ),
                if (_weatherData != null)
                  buildWeatherImage(_weatherData?['weather'][0]['main']),
              ],
            ),
          ),
        ));
  }
}
