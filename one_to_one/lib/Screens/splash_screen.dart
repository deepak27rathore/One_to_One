import 'package:flutter/material.dart';
import 'package:one_to_one/Screens/HomeScreen.dart';
import 'package:one_to_one/main.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initalizing media query (for getting screen size)
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to one to one'),
      ),
      //body
      body: Stack(children: [
        //app logo
        Positioned(
            top: mq.height * .15,
            right: mq.width * .35,
            width: mq.width * .3,
            child: Image.asset('images/icon.png')),
        //google login button
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text('Made in India ❤️',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4E74F9),
                )))
      ]),
      // AppBar
    ); // Scaffold
  }
}