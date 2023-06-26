import 'package:flutter/material.dart';

class TwolistviiewsDialog extends StatefulWidget {
  final Map<String, List<String>> productData;
  final Map<String, Map<String, double>> productPrices;
  //final Function() onAddItem; // New property
  final Function(String, String, int, double) onAddItem;

  TwolistviiewsDialog({
    required this.productData,
    required this.productPrices,
    required this.onAddItem, // Pass the callback function
  });

  @override
  _TwolistviiewsDialogState createState() => _TwolistviiewsDialogState();
}

class _TwolistviiewsDialogState extends State<TwolistviiewsDialog> {
  String selectedProductName = '';
  String selectedProductType = '';
  int quantity = 1;
  bool showProductNamesList = true;
  bool showProductTypesList = false;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredProducts = widget.productData.keys.where((productName) => productName.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    double edgepad = 20;
    return Dialog(
      insetPadding: EdgeInsets.only(left: edgepad, right: edgepad),
      child: SingleChildScrollView(
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
                  List<String> types = widget.productData[productName]!;
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
                                Text('Types: ${types.length}'),
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
                                Text('Types: ${widget.productData[selectedProductName]?.length ?? 0}'),
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
                itemCount: widget.productData[selectedProductName]?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  String type = widget.productData[selectedProductName]?.elementAt(index) ?? '';
                  double price = widget.productPrices[selectedProductName]?[type] ?? 0.0;
                  return ListTile(
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
                                    type,
                                    style: TextStyle(
                                      fontWeight: selectedProductType == type ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'Price: GH₵${price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedProductType = type;
                          showProductTypesList = false;
                        });
                      },
                    ),
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
                                      selectedProductType.isNotEmpty ? selectedProductType : 'Tap to select type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Price: GH₵${widget.productPrices[selectedProductName]?[selectedProductType]?.toStringAsFixed(2) ?? '0.00'}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                  subtitle: Text('GH₵${calculateTotalCost().toStringAsFixed(2)}'),
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    widget.onAddItem(
                      selectedProductName,
                      selectedProductType,
                      quantity,
                      calculateTotalCost(),
                   
                    );
                  },
                  // Call the callback function
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Text('Add Item'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateTotalCost() {
    double price = widget.productPrices[selectedProductName]?[selectedProductType] ?? 0.0;
    return price * quantity;
  }
}
