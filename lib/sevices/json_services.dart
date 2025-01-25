import 'dart:convert';

import 'package:bismo_assignmnet/data_model/store_data.dart';
import 'package:flutter/services.dart';

class JsonServices {
  Future<List<StoreData>> getStoreData() async {
    final data = await rootBundle.loadString("assets/json/gift_cards.json");
    var jsonData = json.decode(data) as List;

    return jsonData.map((e) => StoreData.fromJson(e)).toList();
  }
}
