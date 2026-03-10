class Product {
  String name;
  String pathImage;
  String description;
  bool isActive;
  String qrData;

  Product({required this.name, required this.pathImage, required this.description, this.isActive = false, required this.qrData});
}