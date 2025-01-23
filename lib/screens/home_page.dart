import 'package:bismo_assignmnet/widgets/card_carousel.dart';
import 'package:bismo_assignmnet/widgets/home_list_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Profile image
                Stack(
                  children: [
                    Container(
                      height: height * 0.05,
                      width: height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey, width: 1), // Red border
                        borderRadius: BorderRadius.circular(height * 0.03),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(height * 0.03 -
                            1), // Adjust to account for the border width
                        child: Image.asset(
                          "assets/images/avtar.png",
                          fit: BoxFit
                              .cover, // Ensures the image covers the entire container
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
                            borderRadius: BorderRadius.circular(height * 0.02)),
                        child: Center(
                            child: Image.asset("assets/images/down.png")),
                      ),
                    )
                  ],
                ),

                //Search bar and notification
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

            //carousel card with page view
            CardCarousel(),

            SizedBox(
              height: height * 0.05,
            ),

            //giftcard list
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  HomeListCard(
                    storeImagePath: "assets/images/star_buks.png",
                    storeName: "Stars Caffee",
                    cardType: "Gift Card",
                    isNotified: true,
                    cardColor: Color(0xffc8d5ff),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  HomeListCard(
                      storeImagePath: "assets/images/natuzzi.png",
                      storeName: "Natuzzi",
                      cardType: "Coupon Card",
                      isNotified: false,
                      cardColor: Color(0xffcdc8ff)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  HomeListCard(
                    storeImagePath: "assets/images/Molteni&C.png",
                    storeName: "Stars Caffee",
                    cardType: "Gift Card",
                    isNotified: true,
                    cardColor: Color(0xffc8d5ff),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  HomeListCard(
                      storeImagePath: "assets/images/star_buks.png",
                      storeName: "Stars Caffee",
                      cardType: "Gift Card",
                      isNotified: false,
                      cardColor: Color(0xffffc8d7)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
