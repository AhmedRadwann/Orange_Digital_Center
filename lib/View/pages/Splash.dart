import 'package:flutter/material.dart';
import 'package:odc/View/pages/login.dart';
import 'package:percent_indicator/percent_indicator.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool finish = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/logo.png",
              width: double.infinity,
              height: 130,
            ),
            LinearPercentIndicator(
              restartAnimation: finish,
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: Radius.circular(10),
              progressColor: Colors.deepOrange,
              onAnimationEnd: () {
                setState(() {
                  finish = true;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  print("$finish");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
