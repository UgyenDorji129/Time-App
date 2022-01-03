import 'package:flutter/material.dart';
import 'package:timeapp/screens/choose_location.dart';
import 'package:timeapp/screens/home.dart';
import 'package:timeapp/screens/loading_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/selectLocation': (context) => const SelectLocation()
      }));
}
