import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/screens/widgets/showBottom_Sheet.dart';

class WelcomeOnboard extends StatelessWidget {
  const WelcomeOnboard({super.key});

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
                        textStyle: GoogleFonts.play(
                          fontSize: 45.0,
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
                        // Declare the variables first but assign them later
                        late void Function() openLoginSheet;
                        late void Function() openRegisterSheet;

                        // Define login sheet function
                        openLoginSheet = () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            builder: (context) {
                              return ShowbottomSheet(
                                headerText: 'Login',
                                eText: 'Email',
                                pText: 'Password',
                                buttonText: 'Login',
                                routeText: 'New Member?',
                                routeTextButton: 'Register',
                                onNextRoutePressed: () {
                                  Navigator.pop(context); // Close Login sheet
                                  openRegisterSheet(); // Open Register sheet
                                },
                                optionText: 'Or Sign In with',
                              );
                            },
                          );
                        };

                        // Define register sheet function
                        openRegisterSheet = () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            builder: (context) {
                              return ShowbottomSheet(
                                headerText: 'Register',
                                eText: 'Full Name',
                                pText: 'Create Password',
                                buttonText: 'Sign Up',
                                routeText: 'Already a member?',
                                routeTextButton: 'Login',
                                onNextRoutePressed: () {
                                  Navigator.pop(
                                      context); // Close Register sheet
                                  openLoginSheet(); // Open Login sheet again
                                },
                                optionText: 'Or Register with',
                              );
                            },
                          );
                        };

                        // Initially open the login sheet when button is pressed
                        openLoginSheet();
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.play(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
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
