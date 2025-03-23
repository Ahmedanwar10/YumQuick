import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:yum_quick/Features/home/presentation/views/home_view.dart';
import 'package:yum_quick/core/constants/assets.dart';

class OnBoardingScreenBody extends StatelessWidget {
  OnBoardingScreenBody({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: SizedBox.shrink(), // إزالة العنوان من الموضع الافتراضي
      bodyWidget: SizedBox.shrink(), // إزالة النص من الموضع الافتراضي
      image: SizedBox.shrink(),
      decoration: PageDecoration(
        boxDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    ),
       PageViewModel(
      titleWidget: SizedBox.shrink(), // إزالة العنوان من الموضع الافتراضي
      bodyWidget: SizedBox.shrink(), // إزالة النص من الموضع الافتراضي
      image: SizedBox.shrink(),
      decoration: PageDecoration(
        boxDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    ),
       PageViewModel(
      titleWidget: SizedBox.shrink(), // إزالة العنوان من الموضع الافتراضي
      bodyWidget: SizedBox.shrink(), // إزالة النص من الموضع الافتراضي
      image: SizedBox.shrink(),
      decoration: PageDecoration(
        boxDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.imagesOnboardingA,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.fastfood, size: 50, color: Colors.orange),
                  SizedBox(height: 10),
                  Text(
                    "Order For Food",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 50,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            },
            child: Text(
              "Skip >",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
