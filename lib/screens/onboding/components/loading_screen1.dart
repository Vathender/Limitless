import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'hello_world_page.dart';  

class LoadingScreen1 extends StatefulWidget {
  const LoadingScreen1({super.key});

  @override
  _LoadingScreen1State createState() => _LoadingScreen1State();
}

class _LoadingScreen1State extends State<LoadingScreen1> {
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
        MaterialPageRoute(builder: (context) =>  HelloWorldPage()),
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
              'assets/animations/loading1.json',
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
                        text: "Stay hydrated throughout your exercise routine to maintain energy levels and aid recovery.",
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
