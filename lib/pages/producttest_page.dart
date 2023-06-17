import 'package:flutter/material.dart';
import 'package:simpleflutter/pages/Selectitemtest_page.dart';


class ProducttestPage extends StatefulWidget {
  static const String routeName = '/producttest';

  @override
  State<ProducttestPage> createState() => _ProducttestPageState();
}

class _ProducttestPageState extends State<ProducttestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producttest'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
            ),
            Expanded(
              child: ProductSelectionWidget(
  productname: 'Shoe',
  productTypes: ['Round', 'Flat', 'Square', 'Pointy'],
  prices: [100, 20, 25, 200],
  selectedTypeIndex: null, // Optional
  onProductSelected: (result) {
    // Handle the selected product here
    print('Selected Type: ${result.type}');
    print('Selected Price: ${result.price}');
    print('Selected Index: ${result.index}');
  },
),

            ),
          ],
        ),
      ),
    );
  }
}

