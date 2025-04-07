import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider(
  (ref) => AuthService(
    auth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(),
  ),
);

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;

  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  Future<User?> signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    if (user == null) return null; // User canceled

    final googleAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await auth.signInWithCredential(credential);
    return userCredential.user; // ✅ Return the Firebase user
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // null means success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'This email is already in use.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      } else if (e.code == 'weak-password') {
        return 'Password must be at least 6 characters.';
      } else {
        return 'Something went wrong. Try again.';
      }
    } catch (e) {
      return 'Something went wrong. Try again.';
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Optional: log or handle different error codes
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      final user = auth.currentUser;

      // Check if the user signed in with Google
      for (final userInfo in user?.providerData ?? []) {
        if (userInfo.providerId == 'google.com') {
          await googleSignIn.signOut();
          break;
        }
      }

      await auth.signOut(); // Sign out from Firebase (covers all methods)
    } catch (e) {
      // Optionally log error or handle UI
      rethrow;
    }
  }
}
