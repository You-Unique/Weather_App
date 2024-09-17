import 'package:flutter/material.dart';
import 'package:newapp/screens/home_screen/home_screen.dart';
import 'package:newapp/screens/widgets/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'splash_image'.toPNG(),
            ),
            const Text(
              'Weather',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 60,
                  color: Colors.amberAccent),
            ),
            const Text(
              'Forecasts',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
