import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../auth/otp_screen.dart';
import '../profile_screens/profile_detail.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static String _verificationId = "";
  verifyPhone(String? countryCode, String mobile, BuildContext context) async {
    String phoneNumber = countryCode! + mobile;
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw exception;
        },
        codeSent: (String verId, int? forceCodeResend) {
          _verificationId = verId;
          notifyListeners();
          Navigator.pushNamed(context, OtpScreen.routeName);
        },
        codeAutoRetrievalTimeout: (String verId) {
          _verificationId = verId;
        },
        timeout: const Duration(
          seconds: 120,
        ),
      );
    } on FirebaseAuthException catch (error) {
      print("--> ${error.toString()}");
    }
  }

  verifyOtp(String otp, BuildContext context) async {
    try {
      print("verid -> ${_verificationId}");

      final AuthCredential authCredential = await PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      print("yes here ");
      if (authCredential != null) {
        final UserCredential user = await _firebaseAuth.signInWithCredential(authCredential);
        final User currentUser = await _firebaseAuth.currentUser!;
        print("user signed in ");
        Navigator.pushNamed(context, ProfileDetail.routeName);
      } else {
        throw e;
      }
    } on FirebaseAuthException catch (error) {
      print("--> ${error.toString()}");
    }
    return;
  }
}
