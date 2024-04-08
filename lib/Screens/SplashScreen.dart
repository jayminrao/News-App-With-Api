import 'dart:async';

import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyHomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
          child:Text("Welcome News App",
              style: TextStyle( color: Colors.black, fontSize: 30)
          )
      ),
    );
  }
}