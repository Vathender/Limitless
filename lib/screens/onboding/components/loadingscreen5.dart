import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/screens/onboding/components/Items_list.dart';
import 'package:rive_animation/screens/onboding/components/progresspage.dart';

import 'package:rive_animation/screens/onboding/components/reading_screen.dart';
import 'hello_world_page.dart';  
class LoadingScreen5 extends StatefulWidget {
  const LoadingScreen5({super.key});

  @override
  _LoadingScreen5State createState() => _LoadingScreen5State();
}

class _LoadingScreen5State extends State<LoadingScreen5> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), _navigateToHelloWorldPage);
    Timer(const Duration(seconds: 0), () {
      setState(() {
        _showText = true;
      });
    });
  }

  void _navigateToHelloWorldPage() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  ProgressPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      backgroundColor: CupertinoColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/animation6.json',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 50),  
            if (_showText)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.black,
                      fontFamily: "Poppins", 
                    ),
                    children: [
                      TextSpan(
                        text: "Exercise Tip : ",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Mix up your routine with both cardio and strength training to boost endurance and build muscle, aiming for balanced fitness and better overall health.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
