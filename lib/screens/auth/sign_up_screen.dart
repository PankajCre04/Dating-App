import 'package:dating_app/screens/auth/number_screen.dart';
import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = "/signupScreen";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.16,
          ),
          Image.asset(
            "assets/images/dating_logo.png",
            color: Colors.pink.shade400,
          ),
          SizedBox(height: size.height * 0.06),
          const Text(
            "Sign up to continue",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          InkWell(
            onTap: () {},
            child: AccountButton(
              text: "Continue with email",
              color: Colors.pink.shade400,
              textColor: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PhoneNumberScreen.routeName);
            },
            child: AccountButton(
              text: "Use phone number",
              color: Colors.white,
              textColor: Colors.pink.shade400,
            ),
          ),
          SizedBox(height: size.height * 0.08),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text("or sign up with"),
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Facebook",
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: size.width * 0.4,
                child: SignInButton(
                  Buttons.Google,
                  text: "Google",
                  onPressed: () {},
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Terms of use",
                style: TextStyle(
                  color: Colors.pink.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Privacy policy",
                style: TextStyle(
                  color: Colors.pink.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
