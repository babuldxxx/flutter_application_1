import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';

class ProductCart extends StatelessWidget {
const ProductCart({ super.key, required this.product, this.onPressed});

  final Product product;
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(248, 163, 172, 255),
          border: Border.all(color: Color.fromARGB(255, 54, 52, 180)),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(118, 94, 96, 209),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Image.asset(
                  product.pathImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            ),
            Text(product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800))
          ]
        )
      )
    );
  }
}