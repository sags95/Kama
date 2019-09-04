import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Firebase auth
/// For future reference, Android: After integration + firebase steps, must use debug.keystore to get SHA fingerprints
enum Status {Authenticated, Authenticating, Unauthenticated }

class FirebaseAuthData with ChangeNotifier {
  FirebaseUser _user;
  Status _status = Status.Unauthenticated;
  FirebaseAuth _auth;

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile'
      ]
  );

  FirebaseAuthData.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;


  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    _user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    notifyListeners();
    return user;
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

}