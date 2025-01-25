import 'package:bismo_assignmnet/data_model/store_data.dart';
import 'package:bismo_assignmnet/screens/scanned_result.dart';
import 'package:bismo_assignmnet/sevices/json_services.dart';
import 'package:bismo_assignmnet/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManualAddedPage extends StatefulWidget {
  const ManualAddedPage({super.key});

  @override
  State<ManualAddedPage> createState() => _ManualAddedPageState();
}

class _ManualAddedPageState extends State<ManualAddedPage> {
  final TextEditingController memberIdController = TextEditingController();
  final JsonServices _jsonServices = JsonServices();
  bool isLoading = false;

  // Variables for displaying data
  String storeName = "Store Name";
  String cardType = "Card Type";
  String imagePath = "assets/images/store.png";

  Future<void> _checkAndNavigate() async {
    final enteredCode = memberIdController.text.trim();

    if (enteredCode.isEmpty) {
      _showError("Please enter a Member ID.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Fetch data using JsonServices
      List<StoreData> storeDataList = await _jsonServices.getStoreData();

      // Check if any code matches the enteredCode
      StoreData? matchedStoreData = storeDataList.firstWhere(
        (store) => store.barcodeNumber == enteredCode,
        // orElse: () => null,
      );

      if (matchedStoreData != null) {
        // Update UI with actual data
        setState(() {
          storeName = matchedStoreData.storeName!;
          cardType = matchedStoreData.cardType!;
          imagePath = matchedStoreData.storeImagePath!;
        });

        // Wait for 2 seconds
        await Future.delayed(const Duration(seconds: 1));

        // Navigate to ScannedResultPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScannedResultPage(
              storeName: matchedStoreData.storeName!,
              cardType: matchedStoreData.cardType!,
              scannedValue: matchedStoreData.barcodeNumber!,
              imagePath: matchedStoreData.storeImagePath!,
            ),
          ),
        );
        storeName = "Store Name";
        cardType = "Card Type";
        imagePath = "assets/images/store.png";
        memberIdController.clear();
      } else {
        _showError("Enter a valid code.");
      }
    } catch (e) {
      _showError("Enter a valid code.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff4f7f7),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.03,
                        left: width * 0.04,
                        right: width * 0.04,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_new),
                          ),
                          SizedBox(height: height * 0.02),
                          Center(
                            child: Container(
                              height: height * 0.09,
                              width: height * 0.09,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(height * 0.05),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(height * 0.05),
                                child: Image.asset(
                                  imagePath, // Use dynamic image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              storeName, // Use dynamic store name
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              cardType, // Use dynamic card type
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          TextField(
                            controller: memberIdController,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              labelText: "Member ID",
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 10.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff4f7f7),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          //Text Section
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Discover exclusive benefits with our loyalty card. ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Learn how to earn and redeem points effortlessly with every purchase. ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                                TextSpan(
                                  text: "Read more here.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text:
                                      "Keep track of your rewards and unlock exclusive offers. ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                                TextSpan(
                                  text: "Learn more about redeeming rewards.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Spacer(),
                          isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  buttonText: "Add to Amar Wallet",
                                  onTap: _checkAndNavigate,
                                ),
                          SizedBox(height: height * 0.05),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
