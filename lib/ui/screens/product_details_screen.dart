import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Товар "${product.name}"'),
        backgroundColor: Color.fromARGB(207, 240, 185, 114),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  product.pathImage,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(192, 99, 65, 20),
                      ]
                    )
                  )
                ),

                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(248, 255, 234, 207),
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black45,
                          offset: Offset(2, 2)
                        )
                      ]
                    )
                  )
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(207, 240, 185, 114),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Описание',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(248, 51, 34, 11),
                    )
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 43, 33, 25),
                      )
                    )
                  ),

                  PrettyQrView(
                    qrImage: QrImage(
                      QrCode(8, QrErrorCorrectLevel.H)..addData("${product.name} ${product.isActive}")
                    ),
                    decoration: const PrettyQrDecoration(),
                  )
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
