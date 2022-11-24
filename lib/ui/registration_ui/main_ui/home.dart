import 'package:flutter/material.dart';
import 'package:homefix/ui/registration_ui/main_ui/services_row.dart';
import 'package:homefix/utils/colors.dart';
import 'package:homefix/utils/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Roboto',
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
          // mainAxisS
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              decoration: const BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            // hintText: 'search here',
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
                            child: Text(
                              circularImagesName[index],
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
            // //////////////////////this is a selective circleavatar

            const AvailableServices(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: mbblack,
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
                    child: AspectRatio(
                      aspectRatio: 16 / 12,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height / 2.5,
                        height: 10,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                // color: yellow,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/cleaning.jpeg'))),
                              ),
                            ),
                            const Text(
                              'Cleaning',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                'Free fan cleaning and more',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
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
            ),
          ],
        ),
      ),
    );
  }
}
