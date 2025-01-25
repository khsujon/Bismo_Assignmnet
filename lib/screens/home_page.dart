import 'package:bismo_assignmnet/data_model/store_data.dart';
import 'package:bismo_assignmnet/screens/add_card_page.dart';
import 'package:bismo_assignmnet/screens/search_page.dart';
import 'package:bismo_assignmnet/sevices/json_services.dart';
import 'package:bismo_assignmnet/widgets/card_carousel.dart';
import 'package:bismo_assignmnet/widgets/home_list_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> cardColors = [
    const Color(0xffc8d5ff),
    const Color(0xffcdc8ff),
    const Color(0xffc8d5ff),
    const Color(0xffffc8d7),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.01,
            left: width * 0.04,
            right: width * 0.04,
          ),
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
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                          child: Center(
                              child: Image.asset("assets/images/down.png")),
                        ),
                      ),
                    ],
                  ),

                  // Search bar and notification
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/search_icn.png",
                            height: height * 0.08),
                      ),
                      SizedBox(width: width * 0.01),
                      Image.asset(
                        "assets/images/notification.png",
                        height: height * 0.04,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),

              // Carousel card with page view
              CardCarousel(),

              SizedBox(height: height * 0.05),

              // Four gift cards list from JSON file
              Expanded(
                child: FutureBuilder(
                  future: JsonServices().getStoreData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<StoreData> storeData = snapshot.data!;
                      return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final data = storeData[index];
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: height * 0.02, top: 5),
                            child: HomeListCard(
                              storeImagePath: data.storeImagePath!,
                              storeName: data.storeName!,
                              cardType: data.cardType!,
                              isNotified: index % 2 == 0,
                              cardColor: cardColors[index % cardColors.length],
                            ),
                          );
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Add Wallet button
      floatingActionButton: SizedBox(
        height: height * 0.06,
        width: width * 0.45,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCardPage(),
              ),
            );
          },
          backgroundColor: const Color(0xffDBE3FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 20),
                SizedBox(width: 5),
                Text(
                  "Add to Wallet",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
