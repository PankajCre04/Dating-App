import 'package:dating_app/screens/profile_screens/profile_detail.dart';
import 'package:dating_app/screens/providers/auth_provider.dart';
import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = "/otpScreen";
  OtpScreen({Key? key}) : super(key: key);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = "";
  bool _isLoading = false;
  Color accentPurpleColor = const Color(0xFF6A53A1);
  Color primaryColor = const Color(0xFF121212);
  Color accentPinkColor = const Color(0xFFF99BBD);
  Color accentDarkGreenColor = const Color(0xFF115C49);
  Color accentYellowColor = const Color(0xFFFFB612);
  Color accentOrangeColor = const Color(0xFFEA7A3B);

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
      createStyle(accentPinkColor),
      createStyle(primaryColor),
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
              numberOfFields: 6,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              styles: otpTextStyles,
              showFieldAsBox: false,
              borderWidth: 4.0,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) async {
                _otp = verificationCode;
                setState(() {});
                // await AuthenticationProvider().verifyOtp(verificationCode,context);
                // Navigator.pushNamed(context, ProfileDetail.routeName);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });

                await AuthenticationProvider().verifyOtp(_otp, context);
                setState(() {
                  _isLoading = false;
                });
              },
              child: _isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : AccountButton(text: "Verify", color: Colors.pink.shade400, textColor: Colors.white),
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
