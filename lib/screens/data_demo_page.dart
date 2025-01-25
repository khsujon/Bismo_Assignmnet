import 'package:bismo_assignmnet/data_model/store_data.dart';
import 'package:bismo_assignmnet/sevices/json_services.dart';
import 'package:flutter/material.dart';

class DataDemoPage extends StatefulWidget {
  const DataDemoPage({super.key});

  @override
  State<DataDemoPage> createState() => _DataDemoPageState();
}

class _DataDemoPageState extends State<DataDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: FutureBuilder(
        future: JsonServices().getStoreData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<StoreData> store_data = snapshot.data!;
            return ListView.builder(
              itemCount: store_data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(store_data[index].storeImagePath!),
                  ),
                  title: Text(store_data[index].storeName!),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
