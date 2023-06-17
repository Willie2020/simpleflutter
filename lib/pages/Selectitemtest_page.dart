import 'package:flutter/material.dart';

class ProductSelectionWidget extends StatefulWidget {
  final String productname;
  final List<String> productTypes;
  final List<int> prices;
  final int? selectedTypeIndex;
  final Function(ProductSelectionResult)? onProductSelected;

  ProductSelectionWidget({
    required this.productname,
    required this.productTypes,
    required this.prices,
    this.selectedTypeIndex,
    this.onProductSelected,
  });

  @override
  _ProductSelectionWidgetState createState() => _ProductSelectionWidgetState();
}

class _ProductSelectionWidgetState extends State<ProductSelectionWidget> {
  late String heroTag;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    heroTag = 'productCard_${DateTime.now().microsecondsSinceEpoch}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: heroTag,
              child: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Product name: ${widget.productname}'),
                            Text(
                                'Product Types: ${widget.productTypes.length}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: isExpanded ? null : 0,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: widget.productTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.onProductSelected != null) {
                      widget.onProductSelected!(
                        ProductSelectionResult(
                          type: widget.productTypes[index],
                          price: widget.prices[index],
                          index: index,
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.selectedTypeIndex == index
                          ? Colors.green
                          : Colors.green,
                      borderRadius: BorderRadius.circular(
                        widget.selectedTypeIndex == index ? 20.0 : 0.0,
                      ),
                    ),
                    height: 100.0,
                    width: 100.0,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          width: 100,
                          color: Colors.white,
                        ),
                        Text(
                          'Type: ${widget.productTypes[index]}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Price: ${widget.prices[index]}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSelectionResult {
  final String type;
  final int price;
  final int index;

  ProductSelectionResult({
    required this.type,
    required this.price,
    required this.index,
  });
}
