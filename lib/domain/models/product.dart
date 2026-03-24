class Product {
  String id;
  String name;
  String pathImage;
  String description;
  bool isActive;
  String qrData;

  Product({required this.id, required this.name, required this.pathImage, required this.description, this.isActive = false, required this.qrData});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      name: json['name'],
      pathImage: json['pathImage'],
      description: json['description'],
      isActive: json['isActive'] ?? false,
      qrData: json['qrData'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'pathImage': pathImage,
      'description': description,
      'isActive': isActive,
      'qrData': qrData,
    };
  }
}