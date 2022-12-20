import 'package:dating_app/screens/auth/otp_screen.dart';
import 'package:dating_app/screens/providers/auth_provider.dart';
import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String routeName = "/numberScreen";
  const PhoneNumberScreen({Key? key}) : super(key: key);
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late FlCountryCodePicker countryPicker;
  late CountryCode? countryCode;
  final TextEditingController _numberController = TextEditingController();
  @override
  void initState() {
    final favouritesCountries = ['IN', 'CA', 'US', 'JP'];
    countryPicker = FlCountryCodePicker(
      favorites: favouritesCountries,
      favoritesIcon: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
    countryCode = countryPicker.countryCodes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Phone number",
                style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter your valid phone number. We will send you a 4-digit code to verify your account",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final code = await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: countryCode != null ? countryCode!.flagImage : null,
                            ),
                            Text(
                              "${countryCode != null ? countryCode!.dialCode : 1}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: TextField(
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17, color: Colors.blue.shade600, letterSpacing: 2.0),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  // await AuthenticationProvider().verifyPhone(
                  //   countryCode?.dialCode.toString(),
                  //   _numberController.text.toString(),
                  // );
                  Navigator.pushNamed(context, OtpScreen.routeName);
                },
                child: AccountButton(text: "Continue", color: Colors.pink.shade400, textColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
