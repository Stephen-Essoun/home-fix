import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homefix/utils/colors.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: yellow,
            elevation: 0,
            title: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Home',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: 'Roboto')),
              TextSpan(
                  text: ' Fix',
                  style: TextStyle(
                      fontSize: 30, color: dbrown, fontFamily: 'Roboto'))
            ]))),
        drawer: const Drawer(),
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Hi! Choose\nyour ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontFamily: 'Roboto')),
                          TextSpan(
                            text: 'Service Area',
                            style: TextStyle(
                                fontSize: 30,
                                color: dbrown,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
            Container(
              height: MediaQuery.of(context).size.height / 3.1,
              decoration: const BoxDecoration(
                color: dbblack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'search here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ),
                    ),
                  ),
                  Text('current location',)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
