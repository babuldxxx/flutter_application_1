
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:flutter_application_1/ui/screens/main_screen.dart';
import 'package:flutter_application_1/ui/widgets/text_field_app.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({ super.key });

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var nameController = TextEditingController();
  var descController = TextEditingController();
  // File? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/monkey_drunk.jpg'),
          TextFieldApp(controller: nameController, hintText: 'Название товара',),
          ElevatedButton(
            onPressed: _addProduct, 
            child: Text('Добавить')
          )
        ]
      )
    );
  }
  void _addProduct(){
    if (nameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название товара')),
      );
      return;
    }
    
    final String newId = 'product_${DateTime.now().microsecondsSinceEpoch}_${DateTime.now().microsecond}';

    products.add(
      Product(
        id: newId,
        name: nameController.text,
        description: descController.text,
        pathImage: 'assets/img/monkey_drunk.jpg',
        qrData: newId,
      ),
    );
    
    Navigator.pop(context);
  }
}