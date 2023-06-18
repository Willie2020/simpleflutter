import 'package:flutter/material.dart';
import 'package:simpleflutter/pages/Selectitemtest_page.dart';
import 'package:simpleflutter/pages/twolistviiews_page.dart';





class ProducttestPage extends StatefulWidget {
  @override
  State<ProducttestPage> createState() => _ProducttestPageState();
}

class _ProducttestPageState extends State<ProducttestPage> {
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
                );
              },
            );
          },
          child: Text('Open Dialog'),
        ),
      ),
    );
  }
}
