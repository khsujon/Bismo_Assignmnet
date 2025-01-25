// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeListCard extends StatefulWidget {
  String storeImagePath;
  String storeName;
  String cardType;
  bool isNotified;
  Color cardColor;
  HomeListCard(
      {Key? key,
      required this.storeImagePath,
      required this.storeName,
      required this.cardType,
      required this.cardColor,
      required this.isNotified})
      : super(key: key);

  @override
  State<HomeListCard> createState() => _HomeListCardState();
}

class _HomeListCardState extends State<HomeListCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height * 0.12,
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          decoration: BoxDecoration(
              color: widget.cardColor,
              borderRadius: BorderRadius.circular(width * 0.06)),
          child: Row(
            children: [
              Container(
                height: height * 0.06,
                width: height * 0.06,
                decoration: BoxDecoration(
                  // Red border
                  borderRadius: BorderRadius.circular(height * 0.04),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.04),
                  child: Image.asset(
                    widget.storeImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.storeName,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.cardType,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
        widget.isNotified
            ? Positioned(
                top: -1,
                right: -0.2,
                child: Container(
                  padding: EdgeInsets.all(1),
                  height: height * 0.03,
                  width: height * 0.03,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(height * 0.02)),
                  child: Center(
                      child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
