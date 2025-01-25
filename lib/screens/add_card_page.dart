import 'package:bismo_assignmnet/screens/manual_added_page.dart';
import 'package:bismo_assignmnet/screens/scanned_result.dart';

import 'package:bismo_assignmnet/sevices/json_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardPage extends StatefulWidget {
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  String scannedCode = "";

  Future<void> scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      if (barcode != "-1") {
        final jsonService = JsonServices();
        final storeDataList = await jsonService.getStoreData();

        // Check if the scanned barcode matches any stored barcode
        final matchedData = storeDataList.firstWhere(
          (store) => store.barcodeNumber == barcode,
        );

        if (matchedData != null) {
          // Barcode matched, navigate to the result page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScannedResultPage(
                scannedValue: barcode,
                storeName: matchedData.storeName!,
                cardType: matchedData.cardType!,
                imagePath: matchedData.storeImagePath!,
              ),
            ),
          );
        } else {
          // Barcode not matched, show an error popup
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: const Text(
                "Unknown barcode value!",
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        scannedCode = "Failed to scan: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff1f1e1e),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.15),
          Image.asset("assets/images/Portrait Mode Scanning 1.png"),
          SizedBox(height: 10),
          Text(
            'Add a card',
            style: GoogleFonts.sen(
                textStyle: TextStyle(color: Colors.white, fontSize: 28)),
          ),
          SizedBox(height: height * 0.08),
          InkWell(
            onTap: scanBarcode,
            child: Container(
              height: height * 0.3,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Center(
            child: InkWell(
              onTap: scanBarcode,
              child: Text(
                "Scan the Bar or QR code",
                style: GoogleFonts.poppins(color: Colors.white54, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: height * 0.15),

          // This should place in the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel",
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManualAddedPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffDBE3FA),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Enter manually",
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
