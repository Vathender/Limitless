import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Firstpage.dart';
class LoadingScreen1 extends StatelessWidget{
  const LoadingScreen1({super.key});

 void _navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Firstpage()),
      );
    });
  }

  @override



  Widget build(BuildContext ctx){
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigateAfterDelay(ctx));
    return Scaffold(
      backgroundColor: Colors.white,
                body: 
                Center(
            
                  child: Lottie.network('https://lottie.host/80054d6f-859f-4ef8-adfa-38cef75e33b9/AcE726np3X.json'),
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