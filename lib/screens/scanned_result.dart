import 'package:flutter/material.dart';

class ScannedResultPage extends StatelessWidget {
  final String scannedValue;

  const ScannedResultPage({Key? key, required this.scannedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanned Result"),
      ),
      body: Center(
        child: Text(
          "Scanned Value: $scannedValue",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
