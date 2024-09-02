import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newapp/screens/services/weather_services.dart';
import 'package:newapp/screens/weather_screen/weather_screen_view_model.dart';
import 'package:newapp/screens/widgets/extensions.dart';
import 'package:newapp/screens/widgets/input_field.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;
  String? _localTime;
  final TextEditingController _searchController = TextEditingController();
  String _city = 'Ibadan'; // Default city

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather for the default city at startup
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchWeather() async {
    try {
      var data = await _weatherService.fetchWeather(_city);
      setState(() {
        _weatherData = data;
        _localTime = _getLocalTime(data);
      });
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  void _searchWeather() async {
    if (_searchController.text.isNotEmpty) {
      try {
        var data = await _weatherService.fetchWeather(_searchController.text);
        setState(() {
          _city = _searchController.text; // Update the city to the searched one
          _weatherData = data;
          _localTime = _getLocalTime(data);
          _searchController.clear();
        });
      } catch (e) {
        setState(() {
          _weatherData = null; // Reset _weatherData to null on error
        });
        BotToast.showText(text: e.toString());
      }
    }
  }

  String formatDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('EEEE, d MMMM').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return '$formattedDate $formattedTime';
  }

  String? _getLocalTime(Map<String, dynamic> weatherData) {
    final timezoneOffset = weatherData['timezone'] as int; // offset in seconds
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
        weatherData['dt'] * 1000,
        isUtc: true); // Convert seconds to milliseconds

    // Convert timezone offset from seconds to hours
    final offsetHours = timezoneOffset ~/ 3600;

    // Adjust DateTime based on offset
    final localDateTime = dateTime.add(Duration(hours: offsetHours));

    return formatDateTime(localDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          height: 410,
          width: 330,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(30),
          ),
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
                            ),
                          )
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
                                          Icons.location_on_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        20.vSpace,
                                        const Icon(
                                          Icons.wind_power,
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
                                          'City',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        20.vSpace,
                                        const Text(
                                          'Wind',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        20.vSpace,
                                        const Text(
                                          'Hum',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        20.vSpace,
                                        const Text(
                                          'Weather',
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
                                          '${_weatherData?['name']}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        20.vSpace,
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
                                        ),
                                      ],
                                    ),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.vSpace,
              InputField(
                textEditingController: _searchController,
                label: 'Enter New City',
                hint: 'Search',
                onFieldSubmitted: () {
                  _searchWeather();
                },
                prefixWidget: GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                suffixWidget: GestureDetector(
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onTap: () {
                    _searchWeather();
                  },
                ),
              ),
              35.vSpace,
              const SearchScreenViewModel(),
            ],
          ),
        ),
      ),
    );
  }
}
