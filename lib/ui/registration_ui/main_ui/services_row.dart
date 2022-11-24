import 'package:flutter/material.dart';
import 'package:homefix/utils/colors.dart';

import '../../../utils/images.dart';

class AvailableServices extends StatefulWidget {
  const AvailableServices({super.key});

  @override
  State<AvailableServices> createState() => _AvailableServicesState();
}

class _AvailableServicesState extends State<AvailableServices> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2.3,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _selectedIndex = index;
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: yellow,
                        radius: 26,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(circularImages[index]),
                          backgroundColor:
                              _selectedIndex == index ? yellow : white,
                          radius: 25,
                        ),
                      ),
                      Text(circularImagesName[index])
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
