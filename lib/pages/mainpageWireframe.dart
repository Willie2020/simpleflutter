import 'package:flutter/material.dart';
import 'package:simpleflutter/models/borderStyling.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 50, top: 15, bottom: 15),
              child: Container(
                //color: Colors.blue.shade100,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                padding: EdgeInsets.all(20),
                height: 200,
                child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              //height: 0,
                              width: 200,
                              color: Colors.green,
                              child: Text('Green'),
                            ),
                          );
                        })),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 80,
              child: Row(
                children: [
                  Container(
                    //color: Colors.indigo,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.indigo, borderRadius: allround),
                  ),
                  Expanded(child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: allround),
                      //shape: ShapeBorder(),
                      child: Container(
                        //margin: EdgeInsets.all(10), 
                        //padding: EdgeInsets.all(10),
                        //height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: allround
                        ),
                        child: Center(child: Text('Hello', style: lightColorText,)),
                      ),
                    );
                  }))
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
                          height: 100,
                          width: 50,
                          color: Colors.blue.withOpacity(0.4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.circle_notifications, size: 20,),
                                  Text('Products: 10'),
                                  //Flex(direction: Axis.vertical),
                                  
                                  Text('19')
                                ],
                              ),
                            ), 
                            Expanded(       
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                Text('Products sold: 10'),
                                Text('Products sold: 10'),
                                Text('Products sold: 10')
                              ]),
                            )
                          ]),
                        ),
                      );
                    }))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.green,
      ),
    );
  }
}
