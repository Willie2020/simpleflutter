import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = false;
  int selectedGridItemIndex = -1;

  List<Color> gridItemColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable Widget'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                selectedGridItemIndex = -1; // Reset selected item when collapsing
              });
            },
            child: Container(
              height: 150,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Top Section',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isExpanded ? null : 0,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isExpanded ? 1 : 2,
                  childAspectRatio: isExpanded ? 2.0 : 1.0,
                ),
                itemCount: gridItemColors.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGridItemIndex = index;
                      });
                    },
                    child: Container(
                      color: index == selectedGridItemIndex
                          ? gridItemColors[index]
                          : Colors.transparent,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
