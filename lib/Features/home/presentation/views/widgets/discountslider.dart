import 'package:flutter/material.dart';
import 'package:yum_quick/core/constants/assets.dart';

class DiscountSlider extends StatefulWidget {
  const DiscountSlider({super.key});

  @override
  _DiscountSliderState createState() => _DiscountSliderState();
}

class _DiscountSliderState extends State<DiscountSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> offers = [
    {
      "title": "Experience our delicious new dish",
      "discount": "30% OFF",
      "image": Assets.imagesOfferImage,
    },
    {
      "title": "Special Deal on Sushi!",
      "discount": "20% OFF",
      "image": Assets.imagesOfferImage,
    },
    {
      "title": "Fresh Cupcakes for You",
      "discount": "15% OFF",
      "image": Assets.imagesOfferImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return DiscountCard(
                title: offers[index]["title"]!,
                discount: offers[index]["discount"]!,
                image: offers[index]["image"]!,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            offers.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: _currentPage == index ? 20 : 10,
              height: 5,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.orange : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DiscountCard extends StatelessWidget {
  final String title;
  final String discount;
  final String image;

  const DiscountCard({
    super.key,
    required this.title,
    required this.discount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orange,
      ),
      //padding: const EdgeInsets.only(left: 10, right: 10),
      //margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 210,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
