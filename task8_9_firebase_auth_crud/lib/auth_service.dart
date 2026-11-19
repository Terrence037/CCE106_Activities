
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<void>? _googleSignInInitialization;

  Future<void> _initializeGoogleSignIn() {
    return _googleSignInInitialization ??=
        _googleSignIn.initialize();
  }

  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final GoogleAuthProvider googleProvider =
            GoogleAuthProvider();

        final UserCredential userCredential =
            await _auth.signInWithPopup(googleProvider);

        return userCredential.user;
      } else {
        await _initializeGoogleSignIn();

        final GoogleSignInAccount googleUser =
            await _googleSignIn.authenticate();

        final GoogleSignInAuthentication googleAuth =
            googleUser.authentication;

        final String? idToken = googleAuth.idToken;

        if (idToken == null) {
          throw Exception('Google ID token is missing.');
        }

        final OAuthCredential credential =
            GoogleAuthProvider.credential(
          idToken: idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      }
    } catch (e) {
      debugPrint('Google sign-in error: $e');
      return null;
    }
  }

  Future<User?> registerWithEmail(
      String email, String password) async {
    try {
      final userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      debugPrint('Registration error: $e');
      return null;
    }
  }

  Future<User?> signInWithEmail(
      String email, String password) async {
    try {
      final userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      debugPrint('Login error: $e');
      return null;
    }
  }

  Future<String?> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );

      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'That email address is not valid.';
        case 'user-not-found':
          return 'No account found for that email.';
        case 'too-many-requests':
          return 'Too many attempts. Try again later.';
        default:
          return e.message ?? 'Could not send reset email.';
      }
    } catch (e) {
      return 'Something went wrong. Please try again.';
    }
  }

  Future<void> signOut() async {
    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }

    await _auth.signOut();
  }

  Stream<User?> get userStream => _auth.authStateChanges();
}
