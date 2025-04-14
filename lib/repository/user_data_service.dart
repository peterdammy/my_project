import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/model/user_model.dart';

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({
    required this.auth,
    required this.firestore,
  });

  addUserToFirestore({
    required String displayName,
    required String email,
    required String profilePic,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      email: email,
      profilePic: profilePic,
      userId: auth.currentUser!.uid,
    );

    await firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }
}
