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
import 'hello_world_page.dart';  
class LoadingScreen2 extends StatefulWidget {
  const LoadingScreen2({super.key});

  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
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
        MaterialPageRoute(builder: (context) =>  itemslist()),
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
              'assets/animations/animation2.json',
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
                        text: "Take a brisk 30-minute walk daily. It's an easy, low-impact way to improve your heart health and clear your mind!",
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
