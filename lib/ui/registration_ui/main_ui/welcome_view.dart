import 'package:flutter/material.dart';
import 'package:homefix/utils/colors.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext ctx) {
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
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' Fix',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: mbblack,
                  fontFamily: 'Roboto',
                ),
              )
            ]))),
        drawer: const Drawer(),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(ctx).size.width,
              color: yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(ctx).size.height / 9.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 20,
                    ),
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
                                color: mbblack,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //           The two containers in a row
                  ValueListenableBuilder(
                      valueListenable: Clicked(),
                      builder: (BuildContext context, value, Widget? child) {
                        return Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                child: Container(
                                  height: MediaQuery.of(ctx).size.height / 3.2,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) =>
                                              Clicked().isClicked(false),
                                          toggleable: true,
                                          // activeColor: dbblack,
                                          fillColor: MaterialStateProperty.all(
                                            value ? dbblack : yellow,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'images/business.png'),
                                            ),
                                          )),
                                      const Text(
                                        'Business',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: yellow,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      const Text(
                                        'Organisation',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: dbblack,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                        ),
                                      )
                                    ],
                                  ),
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
                                  height: MediaQuery.of(ctx).size.height / 3.2,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) =>
                                              Clicked().isClicked(true),
                                          fillColor: MaterialStateProperty.all(
                                            value ? yellow : dbblack,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'images/home.jpeg'),
                                              // fit: BoxFit.fill,
                                            ),
                                          )),
                                      const Text(
                                        'Home',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: yellow,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      const Text(
                                        'Personal',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: dbblack,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }) // ends here
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(ctx).size.height / 2.5,
              decoration: const BoxDecoration(
                color: dbblack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(ctx).size.width / 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 30,
                          right: 20,
                        ),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 8),
                    child: Text(
                      'current location',
                      style: TextStyle(
                          fontSize: 18, color: yellow, fontFamily: 'Roboto'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Service location near -',
                      style: TextStyle(
                          fontSize: 18, color: white, fontFamily: 'Roboto'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(ctx).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(ctx).size.width / 3,
                        height: MediaQuery.of(ctx).size.height / 18,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(dbblack),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: const BorderSide(color: white),
                              ),
                            ),
                          ),
                          child: const Text(' Later'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(ctx).size.width / 3,
                        height: MediaQuery.of(ctx).size.height / 18,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(yellow),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          child: const Text('Search now'),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Clicked extends ValueNotifier<bool> {
  Clicked._sharedInference() : super(false);
  static final Clicked _shared = Clicked._sharedInference();
  factory Clicked() => _shared;
  bool get clicked => value;
  void isClicked(bool clicked) {
    value = clicked;
    notifyListeners();
  }
}
