import 'package:flutter/material.dart';
import 'package:simpleflutter/pages/twolistviiews_page.dart';

class ProductTestPage extends StatefulWidget {
  @override
  _ProductTestPageState createState() => _ProductTestPageState();
}

class _ProductTestPageState extends State<ProductTestPage> {
  String selectedItem = '';
  String selectedType = '';
  double selectedPrice = 0.0;
  int selectedQuantity = 1;
  double selectedTotal = 0.0;

  void handleAddItem(String productName, String productType, int quantity, double total) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        // Update the selected values with the values from the dialog
        selectedItem = productName;
        selectedType = productType;
        selectedQuantity = quantity;
        selectedTotal = total;
      });
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return TwolistviiewsDialog(
                  productData: {
                    'Product 1': ['Type A', 'Type B', 'Type C'],
                    'Product 2': ['Type X', 'Type Y', 'Type Z'],
                    'Product 3': ['Type P', 'Type Q', 'Type R'],
                  },
                  productPrices: {
                    'Product 1': {'Type A': 10.0, 'Type B': 15.0, 'Type C': 20.0},
                    'Product 2': {'Type X': 12.0, 'Type Y': 18.0, 'Type Z': 25.0},
                    'Product 3': {'Type P': 8.0, 'Type Q': 14.0, 'Type R': 22.0},
                  },
                  onAddItem: handleAddItem, // Pass the callback function
                );
              },
            );
          },
          child: Text('Open Dialog'),
        ),
      ),
      bottomNavigationBar: selectedItem.isNotEmpty
          ? BottomAppBar(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Selected Product: $selectedItem'),
                    Text('Selected Type: $selectedType'),
                    Text('Quantity: $selectedQuantity'),
                    Text('Total: GH₵$selectedTotal'),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
