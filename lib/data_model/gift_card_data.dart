import 'dart:convert';
import 'package:bismo_assignmnet/widgets/card_carousel.dart';
import 'package:bismo_assignmnet/widgets/home_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> giftCardData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGiftCardData();
  }

  Future<void> loadGiftCardData() async {
    try {
      // Load JSON file from assets
      String jsonString =
          await rootBundle.loadString('assets/json/gift_cards.json');
      List<dynamic> data = json.decode(jsonString);

      // Take the first 4 items from the JSON data
      setState(() {
        giftCardData = data.take(4).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error loading JSON data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.01, left: width * 0.04, right: width * 0.04),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile image
                  Stack(
                    children: [
                      Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(height * 0.03),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(height * 0.03 - 1),
                          child: Image.asset(
                            "assets/images/avtar.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2.5,
                        right: -3.5,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          height: height * 0.025,
                          width: height * 0.025,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(height * 0.02)),
                          child: Center(
                              child: Image.asset("assets/images/down.png")),
                        ),
                      )
                    ],
                  ),

                  // Search bar and notification
                  Row(
                    children: [
                      Image.asset("assets/images/search_icn.png",
                          height: height * 0.08),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Image.asset(
                        "assets/images/notification.png",
                        height: height * 0.04,
                      )
                    ],
                  )
                ],
              ),

              SizedBox(
                height: height * 0.05,
              ),

              // Carousel card with page view
              CardCarousel(),

              SizedBox(
                height: height * 0.05,
              ),

              // Gift card list or loading indicator
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : giftCardData.isEmpty
                        ? Center(
                            child: Text(
                              "No gift cards available",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: giftCardData.length,
                            itemBuilder: (context, index) {
                              final card = giftCardData[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: height * 0.02),
                                child: HomeListCard(
                                  storeImagePath: card['storeImgPath'],
                                  storeName: card['storeName'],
                                  cardType: card['cardType'],
                                  isNotified: index % 2 == 0, // Example logic
                                  cardColor: index % 2 == 0
                                      ? Color(0xffc8d5ff)
                                      : Color(0xffcdc8ff),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
