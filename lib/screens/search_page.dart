import 'package:bismo_assignmnet/widgets/all_store_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();
  FocusNode searchFocusNode = FocusNode(); // Declare FocusNode

  @override
  void dispose() {
    // Dispose of the focus node and text controller when no longer needed
    searchTextController.dispose();
    searchFocusNode.dispose();
    super.dispose();
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
            top: height * 0.03,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Back button with functionality
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  // Search field
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.01,
                      ),
                      child: TextFormField(
                        controller: searchTextController,
                        focusNode: searchFocusNode,
                        onChanged: (value) {
                          setState(() {}); // Update UI on input
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                          ),
                          hintText: 'Search loyalty programmes',
                          suffixIcon: Image.asset(
                              "assets/images/search_icn.png",
                              height: height * 0.03),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.06),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: 90 * 3.14159 / 180, // Rotate 90 degrees
                    child: Icon(CupertinoIcons.slider_horizontal_3),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),

              //all store cards
              Expanded(
                  child: ListView(
                children: [
                  AllStoreCard(
                    storeImagePath: "assets/images/star_buks.png",
                    storeName: "Stars Caffee",
                    cardType: "Gift Card",
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  AllStoreCard(
                    storeImagePath: "assets/images/natuzzi.png",
                    storeName: "Natuzzi",
                    cardType: "Coupon Card",
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  AllStoreCard(
                    storeImagePath: "assets/images/Molteni&C.png",
                    storeName: "Stars Caffee",
                    cardType: "Gift Card",
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
