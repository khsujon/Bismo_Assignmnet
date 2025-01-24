// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AllStoreCard extends StatefulWidget {
  String storeImagePath;
  String storeName;
  String cardType;
  AllStoreCard({
    Key? key,
    required this.storeImagePath,
    required this.storeName,
    required this.cardType,
  }) : super(key: key);

  @override
  State<AllStoreCard> createState() => _AllStoreCardState();
}

class _AllStoreCardState extends State<AllStoreCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.08,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(width * 0.06)),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.cardType,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
