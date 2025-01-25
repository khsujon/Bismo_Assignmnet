# Gift & Loyalty Cards App  

**Gift & Loyalty Cards App** is a fully responsive Flutter application for managing gift cards and loyalty cards. The app allows users to scan barcodes, view card details, and display them with an intuitive and visually appealing interface.  

## Features  

- **Home Screen**: Displays a list of gift and loyalty cards fetched from local JSON data.  
- **Card Details Screen**: Shows detailed information, including the store name, barcode image, and barcode number.  
- **Barcode Scanner**: Integrates the device camera to scan barcodes and display the scanned number.  
- **Responsive Design**: The app is fully responsive and works seamlessly on both Android and iOS devices.  
- **Dummy Data**: Uses local JSON files to simulate real-world card data.  

---

## Dependencies  

The following Flutter packages are used in this project:  
- **google_fonts**: To style text with beautiful fonts from Google Fonts.  
- **smooth_page_indicator**: For creating smooth and customizable page indicators.  
- **flutter_barcode_scanner**: To enable barcode scanning functionality.  
- **barcode_widget**: To generate and display barcode images.  

Add these dependencies to your `pubspec.yaml` file:  
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  smooth_page_indicator: ^1.0.0
  flutter_barcode_scanner: ^2.0.0
  barcode_widget: ^2.0.1
