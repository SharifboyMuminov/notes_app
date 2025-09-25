import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/data/model/sqflite_response.dart';

class AuthRepo {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<NetworkResponse> signWithGoogle() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print('Foydalanuvchi tanlanmadi.');
        networkResponse.errorText = "no_user_selected";
        return networkResponse;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);


      print('Google orqali kirildi: ${userCredential.user?.email}');
    } catch (e) {
      print('Google Sign-In xatolik: $e');
    }

    return networkResponse;
  }
}
