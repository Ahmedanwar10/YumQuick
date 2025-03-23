import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/home_view.dart';
import 'package:yum_quick/core/constants/assets.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "title": "Order For Food",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "icon": Icons.outbox_rounded,
      "image": Assets.imagesOnboardingA,
    },
    {
      "title": "Fast Delivery",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "icon": Icons.payment,
      "image": Assets.imagesOnboardingB,
    },
    {
      "title": "Enjoy Your Meal",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "icon": Icons.fastfood,
      "image": Assets.imagesOnboardingC,
    },
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < -50) {
            nextPage();
          } else if (details.primaryVelocity! > 50) {
            previousPage();
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                pages[currentIndex]["image"],
                fit: BoxFit.cover,
              ),
            ),

            Column(
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        pages[currentIndex]["icon"],
                        size: 50,
                        color:ColorManager.primary,
                      ),
                      const SizedBox(height: 10),

                      // العنوان
                      Text(
                        pages[currentIndex]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:ColorManager.primary,
                        ),
                      ),
                      const SizedBox(height: 10),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          pages[currentIndex]["description"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: nextPage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            currentIndex == pages.length - 1 ? "Get Started" : "Next",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // زر تخطي
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeView()),
                  );
                },
                child: const Text(
                  "Skip >",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
