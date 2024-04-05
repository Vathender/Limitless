import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/screens/onboding/components/sign_in_form.dart';
import 'package:rive_animation/screens/onboding/components/hello_world_page.dart';

Future<Object?> customSigninDialog(BuildContext context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign up",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween = Tween(begin: Offset(0, -1), end: Offset.zero);
      return SlideTransition(
          position: tween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child);
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView( 
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Limitless seamlessly fuses the captivating world of manga with a dynamic fitness regimen, inspiring you to exercise by tying workouts to your reading progress. Engage in a narrative-driven wellness journey where each chapter propels you towards personalized fitness milestones.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignInForm(),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 32), 
                    child: Divider(),
                  ),
                  const Text("Sign up with Email, Apple or Google", style: TextStyle(color: Colors.black54)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 64,
                              width: 64,
                            ))
                      ],
                    ),
                  )
                ],
                
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton( 
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close),
            backgroundColor: Colors.white,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
        ),
      ),
    ),
  ).then(onClosed);
}