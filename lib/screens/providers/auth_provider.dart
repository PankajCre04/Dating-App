import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String verificationid = "";
  Future<void> verifyPhone(String? countryCode, String mobile) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw exception;
        },
        codeSent: (String verId, int? forceCodeResend) {
          this.verificationid = verId;
        },
        codeAutoRetrievalTimeout: (String verId) {
          this.verificationid = verId;
        },
        timeout: const Duration(
          seconds: 300,
        ),
      );
    } on FirebaseAuthException catch (error) {
      print("--> ${error.toString()}");
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      final AuthCredential authCredential = await PhoneAuthProvider.credential(
        verificationId: this.verificationid,
        smsCode: otp,
      );
      if (authCredential != null) {
        final UserCredential user = await _firebaseAuth.signInWithCredential(authCredential);
        final User currentUser = await _firebaseAuth.currentUser!;
      } else {
        throw e;
      }
    } on FirebaseAuthException catch (error) {
      print("--> ${error.toString()}");
    }
  }
}
