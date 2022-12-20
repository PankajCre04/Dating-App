import 'package:dating_app/screens/profile_screens/profile_detail.dart';
import 'package:dating_app/screens/providers/auth_provider.dart';
import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otpScreen";
  OtpScreen({Key? key}) : super(key: key);
  Color accentPurpleColor = Color(0xFF6A53A1);
  Color primaryColor = Color(0xFF121212);
  Color accentPinkColor = Color(0xFFF99BBD);
  Color accentDarkGreenColor = Color(0xFF115C49);
  Color accentYellowColor = Color(0xFFFFB612);
  Color accentOrangeColor = Color(0xFFEA7A3B);

  @override
  Widget build(BuildContext context) {
    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headline3?.copyWith(color: color);
    }

    var otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Type the verification code",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 3),
            const Text(
              "we've sent you",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            OtpTextField(
              numberOfFields: 4,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              styles: otpTextStyles,
              showFieldAsBox: false,
              borderWidth: 4.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here if necessary
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                // await AuthenticationProvider().verifyOtp(verificationCode);
                Navigator.pushNamed(context, ProfileDetail.routeName);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                // AuthenticationProvider().verifyOtp();
                Navigator.pushNamed(context, ProfileDetail.routeName);
              },
              child: AccountButton(text: "Verify", color: Colors.pink.shade400, textColor: Colors.white),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Send otp again",
                  style: TextStyle(color: Colors.pink.shade400, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
