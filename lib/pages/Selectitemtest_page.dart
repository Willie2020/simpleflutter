import 'dart:ffi';

import 'package:flutter/material.dart';

class SelectitemtestPage extends StatefulWidget {
  static const String routeName = '/selectitemtest';

  @override
  _SelectitemtestPageState createState() => _SelectitemtestPageState();
}

class _SelectitemtestPageState extends State<SelectitemtestPage> {
  String productname = 'Shoe';
  String productTypes = '4';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A Dialog'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
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
                              Text('Product name: $productname'),
                              Text('Product Types: $productTypes'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.blue,
                  width: double.infinity,
                  height: 300,
                  // Grid for product types
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              color: Colors.green,
                              height: 100.0,
                              width: 100.0,
                              child: Center(
                                child: Text(
                                  'Type $index',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.indigoAccent,
                height: 100,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
