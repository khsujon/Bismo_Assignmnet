import 'package:bismo_assignmnet/screens/home_page.dart';
import 'package:bismo_assignmnet/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannedResultPage extends StatelessWidget {
  final String scannedValue;

  const ScannedResultPage({Key? key, required this.scannedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff00643c),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button with functionality
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),

              // Success icon and label
              Container(
                width: height * 0.08,
                height: height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(height * 0.05)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Done",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.06),

              // Barcode widget
              Container(
                width: width * 0.7,
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.05, horizontal: width * 0.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Column(
                  children: [
                    BarcodeWidget(
                      data: scannedValue,
                      barcode: Barcode.code128(),
                      width: width * 0.6,
                      height: height * 0.15,
                      drawText: false,
                      color: Colors.black,
                    ),
                    SizedBox(height: height * 0.015),
                    // Barcode number
                    Text(
                      scannedValue,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              // Loyalty Card details
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        "assets/images/star_buks.png",
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
                        "Star Caffee",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Loyalty Card",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),

              //button
              CustomButton(
                buttonText: "Continue",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
