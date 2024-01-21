import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Attempt to sign in with Google
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // If user cancels the sign-in process, gUser will be null
      if (gUser == null) {
        // Handle the cancellation or return null based on your requirements
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle any exceptions that may occur during the sign-in process
      print("Error signing in with Google: $e");
      return null; // You may want to return a specific value or throw an exception here
    }
  }
}
