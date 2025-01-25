// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  String buttonText;
  CustomButton({
    Key? key,
    this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return //button
        Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width * .7,
          padding: EdgeInsets.symmetric(vertical: height * 0.018),
          decoration: BoxDecoration(
              color: const Color(0xffDBE3FA),
              borderRadius: BorderRadius.circular(width * 0.07)),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
