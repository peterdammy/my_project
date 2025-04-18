import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/firebase_options.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/set_username_page.dart';
import 'package:my_project/screens/welcome_onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food World',
        theme: ThemeData(
          primaryColor: Colors.grey,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const WelcomeOnboard();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5.w,
                    color: Colors.blueGrey,
                  ),
                );
              }
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final user = FirebaseAuth.instance.currentUser;
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return SetUsernamePage(
                        displayName: user!.displayName!,
                        email: user.email!,
                        profilePic: user.photoURL!);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5.w,
                        color: Colors.blueGrey,
                      ),
                    );
                  }
                  return const HomeScreen();
                },
              );
            }),
      ),
      designSize: const Size(390, 844),
      minTextAdapt: true,
    );
  }
}
