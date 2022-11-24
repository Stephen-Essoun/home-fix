import 'package:flutter/material.dart';
import 'package:homefix/ui/registration_ui/main_ui/booking_view.dart';
import 'package:homefix/ui/registration_ui/main_ui/home.dart';
import 'package:provider/provider.dart';

import 'package:homefix/ui/registration_ui/main_ui/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => Clicked())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
