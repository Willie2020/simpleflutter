import 'package:flutter/material.dart';

class TwolistviiewsPage extends StatefulWidget {
  static const String routeName = '/twolistviiews';

  @override
  _TwolistviiewsPageState createState() => _TwolistviiewsPageState();
}

class _TwolistviiewsPageState extends State<TwolistviiewsPage> {
  String selectedProductName = '';
  String selectedProductType = '';
  int quantity = 1;
  bool showProductNamesList = true;
  bool showProductTypesList = false;
  String searchQuery = '';

  Map<String, List<String>> productData = {
    'Product 1': ['Type A', 'Type B', 'Type C'],
    'Product 2': ['Type X', 'Type Y', 'Type Z'],
    'Product 3': ['Type P', 'Type Q', 'Type R'],
  };

  Map<String, Map<String, double>> productPrices = {
    'Product 1': {'Type A': 10.0, 'Type B': 15.0, 'Type C': 20.0},
    'Product 2': {'Type X': 12.0, 'Type Y': 18.0, 'Type Z': 25.0},
    'Product 3': {'Type P': 8.0, 'Type Q': 14.0, 'Type R': 22.0},
  };

  @override
  Widget build(BuildContext context) {
    List<String> filteredProducts = productData.keys.where((productName) => productName.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Twolistviiews'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search Products',
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            if (showProductNamesList)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  String productName = filteredProducts[index];
                  List<String> types = productData[productName]!;
                  return ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 100,
                                width: 100,
                              ),
                              Text('Prod Picture'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productName),
                                Text('Number of types: ${types.length}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedProductName = productName;
                        selectedProductType = '';
                        showProductNamesList = false;
                        showProductTypesList = false;
                      });
                    },
                  );
                },
              ),
            if (!showProductNamesList)
              Card(
                child: ListTile(
                  title: GestureDetector(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedProductName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Types: ${productData[selectedProductName]?.length ?? 0}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        showProductNamesList = true;
                        showProductTypesList = false;
                      });
                    },
                  ),
                ),
              ),
            if (showProductTypesList)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productData[selectedProductName]?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  String type = productData[selectedProductName]?.elementAt(index) ?? '';
                  double price = productPrices[selectedProductName]?[type] ?? 0.0;
                  return ListTile(
                    title: GestureDetector(
                      child: Text(
                        type,
                        style: TextStyle(
                          fontWeight: selectedProductType == type ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedProductType = type;
                          showProductTypesList = false;
                        });
                      },
                    ),
                    subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
                  );
                },
              ),
            if (!showProductNamesList)
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: GestureDetector(
                        child: Text(
                          selectedProductType.isNotEmpty ? selectedProductType : 'Tap to select type',
                        ),
                        onTap: () {
                          setState(() {
                            showProductTypesList = true;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            quantity = int.tryParse(value) ?? 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (quantity > 0)
              Card(
                child: ListTile(
                  title: Text('Total Cost'),
                  subtitle: Text('\$${calculateTotalCost().toStringAsFixed(2)}'),
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {}, 
                child: Container(padding: EdgeInsets.all(5), 
                width: double.infinity, 
                child: Text('Add Item'))),
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateTotalCost() {
    double price = productPrices[selectedProductName]?[selectedProductType] ?? 0.0;
    return price * quantity;
  }
}
