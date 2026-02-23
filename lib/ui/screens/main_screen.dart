import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:flutter_application_1/ui/product_cart.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.title});
  final String title;

  final products = [
    Product(name: 'Братка добрый', pathImage: 'assets/img/monkey_good.jpg', description: 'На расслабоне так чисто присматривается'),
    Product(name: 'Братка пьяный', pathImage: 'assets/img/monkey_drunk.jpg', description: 'Перебрал, а теперь лежит и отдыхает. не пейте, друзья.'),
    Product(name: 'Братка на высоте', pathImage: 'assets/img/monkey_high_guy.jpg', description: 'На расслабоне даже больше, чем братка добрый'),
    Product(name: 'Братка селфи', pathImage: 'assets/img/monkey_selfie.jpg', description: 'Турист (с камерой) сфоткался с местным обитателем джунглей'),

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 163, 172, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: (){
              Navigator.pop(context);
            },
            )
        ]
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 20),
            child: ProductCart(product: products[index])
          );
        }
      )
    );
  }
}