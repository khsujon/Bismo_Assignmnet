import 'package:bismo_assignmnet/sevices/json_services.dart';
import 'package:bismo_assignmnet/widgets/all_store_cards.dart';
import 'package:bismo_assignmnet/data_model/store_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<StoreData> allData = [];
  List<StoreData> filteredData = [];
  final JsonServices jsonServices = JsonServices();

  @override
  void initState() {
    super.initState();
    fetchData(); // Load data on initialization
  }

  @override
  void dispose() {
    searchTextController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      final data = await jsonServices.getStoreData();
      setState(() {
        allData = data;
        filteredData = data; // Initially display all data
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

// Show all data if the search query is empty
  void filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = allData;
      } else {
        filteredData = allData.where((store) {
          final storeName = store.storeName!.toLowerCase();
          final cardType = store.cardType!.toLowerCase();
          final searchQuery = query.toLowerCase();
          return storeName.contains(searchQuery) ||
              cardType.contains(searchQuery);
        }).toList();
      }
    });
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.01,
                      ),
                      child: TextFormField(
                        controller: searchTextController,
                        focusNode: searchFocusNode,
                        onChanged: filterData,
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
                    angle: 90 * 3.14159 / 180,
                    child: Icon(CupertinoIcons.slider_horizontal_3),
                  )
                ],
              ),
              SizedBox(height: height * 0.03),

              // Display filtered data or a "No data available" message
              Expanded(
                child: filteredData.isEmpty
                    ? Center(
                        child: Text(
                          "No such data available",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final store = filteredData[index];
                          return Column(
                            children: [
                              AllStoreCard(
                                storeImagePath: store.storeImagePath!,
                                storeName: store.storeName!,
                                cardType: store.cardType!,
                              ),
                              SizedBox(height: height * 0.01),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
