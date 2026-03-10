import 'dart:io';

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
          ElevatedButton(onPressed: (){
            products.add(
              Product(
                name: nameController.text,
                description: descController.text,
                pathImage: 'assets/img/monkey_drunk.jpg',
                qrData: nameController.text,
              )
            );
            Navigator.pop(context);
          }, child: Text('Добавить'))
        ]
      )
    );
  }
}