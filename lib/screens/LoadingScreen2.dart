import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'StoryCatalog.dart'; 
import 'Firstpage.dart';
import 'chapterPage.dart';

class LoadingScreen2 extends StatelessWidget {
  final String title; 

  const LoadingScreen2({super.key, required this.title}); 

  void _navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChapterPage(title: title)), 
      );
    });
  }

  @override
  Widget build(BuildContext ctx) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigateAfterDelay(ctx));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network('https://lottie.host/a6705cdd-61ac-414d-a8fe-045c8fc4cfb7/QhSfxWNg22.json'),
      ),
    );
  }
}

/*SizedBox(height: 30),
              Image.asset(
                'assets/gojo.gif', // Replace with your asset's path
                width: MediaQuery.of(context).size.width * 1.25, // 50% of the screen width
                height: MediaQuery.of(context).size.height * 0.2, // 20% of the screen height
                fit: BoxFit.cover,
              ),*/