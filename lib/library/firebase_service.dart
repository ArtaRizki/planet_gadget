// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<User?> signInwithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();

//       log("USER EMAIL : ${googleSignInAccount!.email}");
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       await _auth.signInWithCredential(credential);
//       User? user = FirebaseAuth.instance.currentUser;
//       // log("USER : $user");
//       if (user != null) {
//         return user;
//       }
//       return null;
//     } on FirebaseAuthException catch (e) {
//       log("Firebase ERROR Exception : " + e.message.toString());
//       rethrow;
//     }
//   }

//   Future<void> signOutFromGoogle() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }
