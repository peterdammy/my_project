import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_project/repository/auth_service.dart';
import 'package:my_project/screens/auth_page.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/set_username_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                120.verticalSpace,
                Text(
                  'Register',
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
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
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: 'confirm password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
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
                24.verticalSpace,
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
                      final confirmPassword =
                          confirmPasswordController.text.trim();

                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          });

                      if (email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in both fields")),
                        );
                        return;
                      }

                      if (password != confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Passwords do not match")),
                        );
                        return;
                      }

                      final errorMessage = await ref
                          .read(authServiceProvider)
                          .signUpWithEmail(email, password);

                      Navigator.pop(context);

                      if (errorMessage == null) {
                        // Success
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } else {
                        // Show specific error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
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
                  'or sign up with',
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
                            20.horizontalSpace,
                            Text(
                              'Sign In With Google',
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
            80.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account',
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
                            builder: (context) => const AuthPage()));
                  },
                  child: Text(
                    'Sign In',
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
