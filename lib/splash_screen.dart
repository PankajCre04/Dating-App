import 'package:dating_app/screens/auth/sign_up_screen.dart';
import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String routeName = "/splashScreen";
  int _currentIndex = 0;
  final List _imagesList = [
    "assets/images/girl1.png",
    "assets/images/girl2.png",
    "assets/images/girl3.png",
  ];

  final List constTextData = [
    [
      "Algorithm",
      "ensure you never matches with bots",
      "Users going through a vetting process to",
    ],
    [
      "Matches",
      "We watch you with people that have a",
      "large array of similar interests",
    ],
    [
      "Premium",
      "Sign up today and enjoy the first month",
      "of premium benefits on us",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: _imagesList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(i),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${constTextData[_currentIndex][0]}",
              style: TextStyle(
                color: Colors.pink.shade400,
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${constTextData[_currentIndex][1]}",
              style: const TextStyle(color: Colors.black, fontSize: 13),
              maxLines: 1,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "${constTextData[_currentIndex][2]}",
              style: const TextStyle(color: Colors.black, fontSize: 13),
              maxLines: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: _currentIndex.toDouble(),
              decorator: const DotsDecorator(
                color: Colors.grey, // Inactive color
                activeColor: Colors.redAccent,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
              child: AccountButton(
                text: "Create an account",
                color: Colors.pink.shade400,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                children: [
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(color: Colors.pink.shade400, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
