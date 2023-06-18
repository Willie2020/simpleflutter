import 'package:flutter/material.dart';
import 'package:simpleflutter/pages/Selectitemtest_page.dart';
import 'package:simpleflutter/pages/producttest_page.dart';
import 'package:simpleflutter/pages/twolistviiews_page.dart';
import 'package:simpleflutter/pages/widget2test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProducttestPage()
      //home: ExpandableWidget()
      //home:TwolistviiewsPage() 
    );
  }
}
