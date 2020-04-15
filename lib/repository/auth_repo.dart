import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseprofiletutorial/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = await _auth.currentUser();
    return UserModel(firebaseUser.uid, displayName: firebaseUser.displayName);
  }
}
