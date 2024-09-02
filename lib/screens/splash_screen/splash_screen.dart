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
            20.vSpace,
            GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30)),
                    color: Colors.amberAccent),
                height: 50,
                width: 220,
                child: Center(
                    child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.blue[900]),
                )),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
