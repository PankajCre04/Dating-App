import 'package:dating_app/screens/auth/number_screen.dart';
import 'package:dating_app/screens/auth/otp_screen.dart';
import 'package:dating_app/screens/auth/sign_up_screen.dart';
import 'package:dating_app/screens/home_screen/home_screen.dart';
import 'package:dating_app/screens/profile_screens/profile_detail.dart';
import 'package:dating_app/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/signupScreen':
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case '/numberScreen':
        return MaterialPageRoute(builder: (context) => PhoneNumberScreen());
      case '/otpScreen':
        return MaterialPageRoute(builder: (context) => OtpScreen());
      case ProfileDetail.routeName:
        return MaterialPageRoute(builder: (context) => ProfileDetail());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Page not found"),
        ),
      );
    });
  }
}
