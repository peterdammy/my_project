import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_project/repository/auth_service.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/sign_up_page.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                120.verticalSpace,
                Text(
                  'Login',
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                  ),
                ),
                24.verticalSpace,
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: 'email',
                    hintStyle: GoogleFonts.play(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                  ),
                ),
                14.verticalSpace,
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: 'password',
                    hintStyle: GoogleFonts.play(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                  ),
                ),
                14.verticalSpace,
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.play(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                    ),
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;

                      // Check if empty
                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in both fields")),
                        );
                        return;
                      }

                      final user = await ref
                          .read(authServiceProvider)
                          .signInWithEmail(email, password);

                      // Navigate on success
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid email or password")),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.play(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                24.verticalSpace,
                Text(
                  'or sign in with',
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                10.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          });
                      final user = await ref
                          .read(authServiceProvider)
                          .signInWithGoogle();

                      Navigator.pop(context);

                      if (user != null) {
                        // Sign-in was successful
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } else {
                        // Sign-in failed or canceled
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Google Sign-In failed")),
                        );
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(
                            width: 1.5.w,
                            color: Colors.blueGrey,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 4)
                            .r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/googlen.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            50.horizontalSpace,
                            Text(
                              'Google',
                              style: GoogleFonts.play(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Member',
                  style: GoogleFonts.play(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.play(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
