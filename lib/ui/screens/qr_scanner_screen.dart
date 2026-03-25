import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/product.dart';
import 'package:flutter_application_1/ui/screens/product_details_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key, required this.products});

  final List<Product> products;

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool _isScanned = false;
  final MobileScannerController _controller = MobileScannerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Сканер QR-кода"),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: (){
              _controller.toggleTorch();
            }
            )
        ],
      ),
      body:  Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: (capture){
              if (_isScanned) return;

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes){
                final String? value = barcode.rawValue;
                if(value != null && value.isNotEmpty){
                  _isScanned = true;
                  
                  _findAndNavigateToProduct(value);
                  break;
                }
              }
          }),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color.fromARGB(255, 4, 0, 255),
                  width: 4,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _findAndNavigateToProduct(String qrValue) async {
    final product = widget.products.firstWhere(
      (prod) => prod.qrData == qrValue,
    );

    if (mounted){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product),
        ),
      );
    }
  }
}