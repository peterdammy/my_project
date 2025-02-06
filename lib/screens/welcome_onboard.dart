import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/widgets/showBottom_Sheet.dart';

class WelcomeOnboard extends StatelessWidget {
  const WelcomeOnboard({super.key});

  void showAuthBottomSheet(BuildContext context, {required bool isLogin}) {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (bottomSheetContext) {
        return ShowbottomSheet(
          headerText: isLogin ? 'Login' : 'Sign Up',
          eText: 'email',
          pText: 'password',
          buttonText: isLogin ? 'Login' : 'Sign Up',
          routeText: isLogin ? 'New Member? ' : 'Already a member? ',
          routeTextButton: isLogin ? 'Sign Up' : 'Login',
          onNextRoutePressed: () {
            // Dismiss the current bottom sheet.
            Navigator.pop(bottomSheetContext);
            // Toggle the mode and show the bottom sheet again.
            // Use the outer context here to avoid issues with the popped context.
            showAuthBottomSheet(context, isLogin: !isLogin);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/image6.jpeg'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Expanded(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'WELCOME \nTO \nFOOD WORLD',
                        textStyle: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        speed: const Duration(milliseconds: 300),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Start with the login bottom sheet.
                        showAuthBottomSheet(context, isLogin: true);
                      },
                      child: const Text("Login/SignUp"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
