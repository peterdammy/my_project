import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final formKey = GlobalKey<FormState>();

class SetUsernamePage extends StatefulWidget {
  const SetUsernamePage({super.key});

  @override
  State<SetUsernamePage> createState() => _SetUsernamePageState();
}

class _SetUsernamePageState extends State<SetUsernamePage> {
  final usernameController = TextEditingController();

  void validateUsernamae() async {
    final userMap = await FirebaseFirestore.instance.collection("Users").get();
    final users = userMap.docs.map((user) => user).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Username',
                textAlign: TextAlign.left,
                style: GoogleFonts.play(
                  fontWeight: FontWeight.w900,
                  fontSize: 24.sp,
                  color: Colors.blueGrey,
                ),
              ),
              30.verticalSpace,
              Form(
                child: TextField(
                  key: formKey,
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    suffixIcon: Icon(Icons.verified),
                    suffixIconColor: Colors.green,
                    hintText: 'Enter your username',
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
              ),
              30.verticalSpace,
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
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: GoogleFonts.play(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
