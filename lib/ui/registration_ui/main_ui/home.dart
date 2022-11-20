import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homefix/utils/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: const BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.height * 0.45,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        //displays below the search bar
                        ...List.generate(
                          4,
                          (index) => TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontFamily: 'Roboto',
                                    decoration: TextDecoration.underline),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: const Text(
                              'Plumbing',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_pin),
                      const Text('Service location near - '),
                      DropdownButton(items: const [
                        DropdownMenuItem(
                            child: Text(
                          'Service location near',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              decoration: TextDecoration.underline),
                        ))
                      ], onChanged: (value) {})
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              _selectedIndex = index;
                            },
                          );
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 9,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: yellow,
                                radius: 34,
                                child: CircleAvatar(
                                  backgroundColor:
                                      _selectedIndex == index ? yellow : white,
                                  radius: 32,
                                ),
                              ),
                              const Text('data')
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: dbrown,
                height: MediaQuery.of(context).size.height / 3.8,
                child: const Center(
                    child: Text(
                  'No ads available!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: yellow,
                    fontSize: 30,
                  ),
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Best Offers',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Hygienic & single use product',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.grey),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height / 2.5,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            // width: MediaQuery.of(context).size.height / 2,
                            color: dbrown,
                          ),
                          const Text(
                            'data',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Free fan cleaning and more',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
