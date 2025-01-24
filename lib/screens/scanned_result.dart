import 'package:flutter/material.dart';

class ScannedResultPage extends StatelessWidget {
  final String scannedValue;

  const ScannedResultPage({Key? key, required this.scannedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff00643c),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button with functionality
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  ),

                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                "Scanned Value: $scannedValue",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
