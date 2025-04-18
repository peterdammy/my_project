// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:my_project/provider/user_data_service_provider.dart';

final formKey = GlobalKey<FormState>();

class SetUsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String email;
  final String profilePic;
  const SetUsernamePage({
    super.key,
    required this.displayName,
    required this.email,
    required this.profilePic,
  });

  @override
  ConsumerState<SetUsernamePage> createState() => _SetUsernamePageState();
}

class _SetUsernamePageState extends ConsumerState<SetUsernamePage> {
  final usernameController = TextEditingController();
  bool validateUsername = true;

  void validateUsernamae() async {
    final userMap = await FirebaseFirestore.instance.collection("Users").get();
    final users = userMap.docs.map((user) => user).toList();
    String? exixtingUsername;

    for (var user in users) {
      if (usernameController.text == user.data()['username']) {
        exixtingUsername = user.data()['username'];
        validateUsername = false;
        setState(() {});
      }

      if (usernameController.text != exixtingUsername) {
        validateUsername = true;
        setState(() {});
      }
    }
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
                child: TextFormField(
                  onChanged: (displayName) {
                    validateUsername;
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (displayName) {
                    return validateUsername ? null : "username already exist";
                  },
                  key: formKey,
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    suffixIcon: validateUsername
                        ? Icon(Icons.verified_user)
                        : Icon(Icons.cancel),
                    suffixIconColor:
                        validateUsername ? Colors.green : Colors.red,
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
                  onPressed: () async {
                    validateUsername
                        ? await ref
                            .read(UserDataServiceProvider)
                            .addUserToFirestore(
                              displayName: widget.displayName,
                              email: widget.email,
                              profilePic: widget.profilePic,
                            )
                        : null;
                  },
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
