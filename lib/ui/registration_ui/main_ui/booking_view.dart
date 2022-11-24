import 'package:flutter/material.dart';
import 'package:homefix/ui/registration_ui/main_ui/services_row.dart';
import 'package:homefix/utils/colors.dart';

import '../../../utils/images.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: dbblack,
              child: const Center(
                  child: Text(
                'map not available',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: white,
                  fontFamily: 'Roboto',
                ),
              )),
            ),
          ),

          // //////////////////////this is a selective circleavatar
          const AvailableServices(),

          //////////////////////////////Beginning of the last container
          Container(
            height: MediaQuery.of(context).size.height / 3.1,
            decoration: const BoxDecoration(
              color: dbblack,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: 'Per Hour charges:',
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '\$350',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: yellow,
                        fontFamily: 'Roboto',
                      ),
                    )
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: 'Note:',
                      style: TextStyle(
                        color: yellow,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'Parts price is additional',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: white,
                        fontFamily: 'Roboto',
                      ),
                    )
                  ])),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 0.8,
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 18,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(dbblack),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 18,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(yellow),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
