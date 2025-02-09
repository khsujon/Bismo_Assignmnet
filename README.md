# Gift & Loyalty Cards App  


## Features  

- **Home Screen**: Displays a list of gift and loyalty cards fetched from local JSON data.  
- **Search Screen**: Shows detailed information and the user can search with a store name or card type
- **Barcode Scanner**: Integrates the device camera to scan barcodes and display the scanned number.
- **Manually input code**: User can manually input code. 
- **Responsive Design**: The app is fully responsive and works seamlessly on both Android and iOS devices.  
- **Dummy Data**: Uses local JSON files to simulate card data.  

---

## Dependencies  

The following Flutter packages are used in this project:  
- **google_fonts**: To style text with beautiful fonts from Google Fonts.  
- **smooth_page_indicator**: For creating smooth and customizable page indicators.  
- **flutter_barcode_scanner**: To enable barcode scanning functionality.  
- **barcode_widget**: To generate and display barcode images in app.

Add these dependencies to your `pubspec.yaml` file:  
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  smooth_page_indicator: ^1.0.0
  flutter_barcode_scanner: ^2.0.0
  barcode_widget: ^2.0.1
```

Add these dependencies to your `pubspec.yaml` file and run:
```bash
flutter pub get
```

## 📂 Folder Structure

The project follows a clean and modular folder structure:
```bash
lib/
├── main.dart             # Entry point
├── screens/              # Contains all the UI screens
├── widgets/              # Custom widgets used across the app
├── data_models/          # Data models for cards
└── services/             # Utility functions and helpers
```

## 🖥️ Setup Instructions
Follow these steps to set up and run the project:
```bash
//1.Clone the repository:
git clone <repository-url>
cd <repository-folder>

//2.Install Flutter dependencies:
flutter pub get

//3.Run the app:(For Android)
flutter run

//For iOS (requires macOS):
flutter run -d ios

//4.Build the app:
flutter build apk
```
## JSON Data Example
Below is an example of the JSON format used for local data:
```json
[
    {
      "storeName": "Starbucks",
      "cardType": "Gift Card",
      "storeImagePath": "assets/images/star_buks.png",
      "barcodeNumber": "123456789012"
    },
    {
      "storeName": "Natuzzi",
      "cardType": "Rewards",
      "storeImagePath": "assets/images/natuzzi.png",
      "barcodeNumber": "234567890123"
    },
]
```
## 🧑‍💻 Author
Developed by Kamrul Hasan.
