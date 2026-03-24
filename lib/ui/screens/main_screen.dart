import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:flutter_application_1/ui/product_cart.dart';
import 'package:flutter_application_1/ui/screens/add_product_screen.dart';
import 'package:flutter_application_1/ui/screens/product_details_screen.dart';
import 'package:flutter_application_1/ui/screens/qr_scanner_screen.dart';

  final products = [
    Product(
      id: '1',
      name: 'Братка добрый',
      pathImage: 'assets/img/monkey_good.jpg',
      description: 'На расслабоне так чисто присматривается',
      qrData: 'Data 1',
    ),
    Product(
      id: '2',
      name: 'Братка пьяный',
      pathImage: 'assets/img/monkey_drunk.jpg',
      description: 'Перебрал, а теперь лежит и отдыхает. не пейте, друзья.',
      isActive: true,
      qrData: 'Data 2',
    ),
    Product(
      id: '3',
      name: 'Братка на высоте',
      pathImage: 'assets/img/monkey_high_guy.jpg',
      description: 'На расслабоне даже больше, чем братка добрый',
      qrData: 'Data 3',
    ),
    Product(
      id: '4',
      name: 'Братка селфи',
      pathImage: 'assets/img/monkey_selfie.jpg',
      description: 'Турист (с камерой) сфоткался с местным обитателем джунглей',
      isActive: true,
      qrData: 'Data 4',
    ),
  ];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 163, 172, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrScannerScreen(products: products,)));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 20),
            child: ProductCart(
              product: products[index],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: products[index])
                  )
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProductScreen(),
          ),
        ).then((_){
          setState((){});
        });
      }, child: Icon(Icons.add),
      ),
    );
  }
}
