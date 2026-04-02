import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:flutter_application_1/ui/screens/main_screen.dart';
import 'package:flutter_application_1/ui/widgets/text_field_app.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var nameController = TextEditingController();
  var descController = TextEditingController();
  String? _imagePath = '';
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: _imagePath != "" || _imageFile != null
                ? (_imagePath!.startsWith('assets/')
                      ? Image.asset(
                          _imagePath!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _imageFile!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
                      SizedBox(height: 8,),
                      Text('Нажмите для выбора фото')
                    ],
                  )
                ),
          ),),
          const SizedBox(height: 16,),
          TextFieldApp(controller: nameController, hintText: 'Название товара'),
          ElevatedButton(onPressed: _addProduct, child: Text('Добавить')),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imagePath = picked.path;
      });
    }
  }

  void _addProduct() {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Введите название товара')));
      return;
    }

    final String newId =
        'product_${DateTime.now().microsecondsSinceEpoch}_${DateTime.now().microsecond}';

    products.add(
      Product(
        id: newId,
        name: nameController.text,
        description: descController.text,
        pathImage: _imagePath ?? '',
        qrData: newId,
      ),
    );

    Navigator.pop(context);
  }
}
