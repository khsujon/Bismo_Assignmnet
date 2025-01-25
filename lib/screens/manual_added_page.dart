import 'package:bismo_assignmnet/screens/scanned_result.dart';
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                                "assets/images/star_buks.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Star Caffee",
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Loyalty Card",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(9),
                                height: height * 0.05,
                                width: height * 0.05,
                                decoration: BoxDecoration(
                                  color: const Color(0xffebebeb),
                                  borderRadius:
                                      BorderRadius.circular(height * 0.03),
                                ),
                                child: Image.asset('assets/images/scan.png'),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Scan your card",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.05),

                        // Text Field for Member ID
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
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
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

                        //button
                        CustomButton(
                          buttonText: "Add to Amar Wallet",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScannedResultPage(
                                    storeName: "Nike",
                                    cardType: "Gift",
                                    scannedValue: memberIdController.text,
                                    imagePath: "assets/images/apple.png",
                                  ),
                                ));
                          },
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
    );
  }
}
