import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardCarousel extends StatefulWidget {
  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // PageView for Cards
        SizedBox(
          height: width * 0.6,
          child: PageView(
            controller: _pageController,
            children: [
              _buildCard('assets/images/card-1.png'),
              _buildCard('assets/images/card-2.png'),
              _buildCard('assets/images/card-1.png'),
              _buildCard('assets/images/card-2.png'),
              _buildCard('assets/images/card-1.png'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // SmoothPageIndicator
        SmoothPageIndicator(
          controller: _pageController,
          count: 5,
          axisDirection: Axis.horizontal,
          effect: SlideEffect(
              spacing: 8.0,
              radius: 7.0,
              dotWidth: 14.0,
              dotHeight: 14.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 3,
              dotColor: Colors.grey,
              activeDotColor: Colors.black),
        ),
      ],
    );
  }

  // Helper to Build Cards
  Widget _buildCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
