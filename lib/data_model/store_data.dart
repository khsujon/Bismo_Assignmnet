class StoreData {
  String? storeName;
  String? cardType;
  String? storeImagePath;
  String? barcodeNumber;

  StoreData(
      {this.storeName, this.cardType, this.storeImagePath, this.barcodeNumber});

  StoreData.fromJson(Map<String, dynamic> json) {
    storeName = json['storeName'];
    cardType = json['cardType'];
    storeImagePath = json['storeImagePath'];
    barcodeNumber = json['barcodeNumber'];
  }
}
